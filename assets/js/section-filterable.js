(function() {

  var attached = function() {
    var $this = $(this);
    var $filter = $this.attr('data-filter') || '.card';
    var $filterableForm = $this.find('.filterable-form');
    var $filterableInputs = $this.find('.filterable-form').find('input');
    var filterItems = $this.find($filter);

    var selectedIds = function() {

      var nodeIds = $filterableForm
        .find('input:checked')
        .map(function() {
          return this.id;
        })

      return Array.prototype.slice.call(nodeIds);
    }

    // show all
    var reset = function() {
      filterItems.attr('aria-hidden', false);
    }

    var hideAll = function(ids) {
      ids.attr('aria-hidden', true);
    }

    var filterIds = function(ids) {
      return filterItems.filter(function(i, item) {
        var bucketId = $(item).attr('data-bucket');
        // return if checked ids don't match the value of the card
        return ids.indexOf(bucketId) < 0
      });
    }

    $filterableInputs.on('change', function filter() {
      var ids = selectedIds()
      if (ids) {
        var filteredIds = filterIds(ids);
        reset();
        // hide unchecked fields
        hideAll(filteredIds);
      }

    });
  };

  var detached = function() {
  };

  document.registerElement('section-filterable', {
    'extends': 'section',
    prototype: Object.create(
      HTMLElement.prototype,
      {
        attachedCallback: {value: attached},
        detachedCallback: {value: detached}
      }
    )
  });

})();
