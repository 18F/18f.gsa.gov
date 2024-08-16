module.exports = async (url, title=url) => `<div class='embed-container'><iframe src='${url}' title='${title}' width='560' height='315' frameborder='0' allowfullscreen></iframe></div>`;
