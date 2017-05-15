window.addEventListener('load', function() {
        SpatialNavigation.init();
        SpatialNavigation.add({
          selector: 'a, .focusable'
        });
        SpatialNavigation.makeFocusable();
        SpatialNavigation.focus();
      });