const { DateTime } = require('luxon')

// Builds the file path for a related posts cache, using the current time.
//   Optionally pass in timestamp for a deterministic result.
// @param ts [number, string, undefined] Timestamp to assign to the filename
// @return [string] Filepath to a related posts cache
// @example With no given timestamp, uses current time
//   filepath() => `.cache/related-posts-1720796065028`
// @example With a given timestamp
//   filepath(1737392400000) => `.cache/related-posts-1737392400000`
const filepath = (ts=undefined) => {
  return `.cache/related-posts-${ ts || DateTime.now().ts }.json`
}

// Creates a related posts cache file for the current time (or given timestamp)
//   and writes the given object to the file as JSON data
// @param ts [number, string, undefined] Timestamp to assign to the filename
// @param data [object] data to write to the file
// @return [undefined]
const createFile = (data={}, ts=undefined) => {
  return fs.writeFileSync(filepath(ts), JSON.stringify(data))
}

// @return [Array<string>] List of filepaths to related posts caches
const cacheFiles = () => {
  return fs.readdirSync('.cache').filter(file => file.startsWith('related-posts-')).sort().reverse()
}

// @return [object] JSON data from the most recent cache
const currentCache = () => {
  return JSON.parse(fs.readFileSync(`.cache/${cacheFiles()[0]}`))
}

// Deletes all caches except the cache with the most future date
// @return [undefined]
const deleteOldCaches = () => {
  cacheFiles().slice(1,).forEach(file => fs.unlinkSync(`.cache/${file}`))
}

// Deletes all caches
// @return [undefined]
const deleteAllCaches = () => {
  cacheFiles().forEach(file => fs.unlinkSync(`.cache/${file}`))
}



/*
usage:

Create a bunch of related posts files

createFile()
createFile()
createFile()
createFile({hi: "tadhg"})


Get the data from the file with the latest date (it should have content).

currentCache()


Delete all the caches except the latest one

deleteOldCaches()


The current cache should still be there

currentCache()


Delete all the caches except the latest one

deleteAllCaches()


The current cache shouldn't exit

currentCache()


*/
