const fs = require('fs');
const { DateTime } = require('luxon')


// Manages caches of JSON data, by default related posts.
// Creates caches, retrieves them, and deletes old cache files
//
// Usage:
//   const cache = new Cache
//   cache.save({ some: "data" })
//   cache.current
//     #=> { some: "data" }
class Cache {

  constructor(dir='.cache', namespace='related-posts') {
    this.dir = dir
    this.namespace = namespace
  }

  // Builds the file path for a cache, using the current time.
  //   Optionally pass in timestamp for a deterministic result.
  // @param ts [number, string, undefined] Timestamp to assign to the filename
  // @return [string] Filepath to a cache
  // @example With no given timestamp, uses current time
  //   filepath() => `.cache/related-posts-1720796065028`
  // @example With a given timestamp
  //   filepath(1737392400000) => `.cache/related-posts-1737392400000`
  filepath = (ts=undefined) =>  `${ this.dir }/${ this.namespace }-${ ts || DateTime.now().ts }.json`

  // Creates a cache file for the current time (or given timestamp)
  //   and writes the given object to the file as JSON data
  // @param ts [number, string, undefined] Timestamp to assign to the filename
  // @param data [object] data to write to the file
  // @return [undefined]
  save = (data={}, ts=undefined) => fs.writeFileSync(this.filepath(ts), JSON.stringify(data))

  // @return [Array<string>] List of filepaths to caches
  files = () => fs.readdirSync(this.dir).filter(file => file.startsWith(`${ this.namespace }-`)).sort().reverse()

  // @return [object] JSON data from the most recent cache
  exists = () => this.files().length > 0

  // @return [object] JSON data from the most recent cache
  current = () => JSON.parse(fs.readFileSync(`${ this.dir }/${this.files()[0]}`))

  // Deletes all caches except the cache with the most future date
  // @return [undefined]
  deleteOutdated = () => this.files().slice(1,).forEach(file => fs.unlinkSync(`${ this.dir }/${file}`))

  // Deletes all caches
  // @return [undefined]
  deleteAll = () => this.files().forEach(file => fs.unlinkSync(`${ this.dir }/${file}`))

  saveAndClean = (data={}, ts=undefined) => {
    this.save(data, ts)
    this.deleteOutdated()
  }

}


module.exports = Cache
