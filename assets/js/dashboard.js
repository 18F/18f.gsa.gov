var modules = [];
var GITHUB_API = "https://api.github.com/";
var GOVCODE_API = "https://api.govcode.org/"
var ORGANIZATION = "18f";
// team api will always be at the same server the dashboard is running on, this
// makes it flexible for local dev environments by sniffing out the beginning of
// url and lopping any subdirectories off the browser's current document
var docUrl = document.URL;
var substrBegin = docUrl.startsWith('https://') ? 8 : 7;
var urlRootIndex = docUrl.substr(substrBegin).indexOf('/');
var urlRoot = docUrl.substr(0,urlRootIndex+substrBegin);
var TEAM = urlRoot+"/api/data/team.json"

modules[0] = function(repo_name) {
  $.getJSON(GOVCODE_API+"repos/"+repo_name, function(data) {
      var issues = data['OpenIssues'];
      var stars = data['Stargazers'];
      var forks = data['Forks'];
      var name = repo_name.replace(/[\. ,:-]+/g, "-");
      $("."+name + " .issues").append(""+issues);
      $("."+name + " .stars").append(""+stars);
      $("."+name + " .forks").append(""+forks);
    }).error(function () {
      $("."+name + " .issues").append("Not available.");
      $("."+name + " .stars").append("Not available.");
      $("."+name + " .forks").append("Not available.");
  });
}

modules[1] = function() {
  $.getJSON(TEAM, function(data) {
    var staffers = $(".staff > li");
    _.each(staffers, function(staffer) {
      console.log(staffer);
      var name = $(staffer).attr('class');
      var obj = _.where(data, {"name":name})[0];
      $(staffer).text(obj.full_name);
    });
  });
}

$(document).ready(function() {
  render_dashboard();
});

var render_modules = function(name) {
  modules[0](name);
  modules[1]();
}

var render_dashboard = function() {
  var ghURLs = $(".github-url");
  _.each(ghURLs, function(ghURL) {
    var url = $(ghURL).attr("href");
    var slugIndex = url.lastIndexOf("/");
    var name = url.substr(slugIndex+1);
    render_modules(name);
  });
}
