$(function() {
  var old_collapsed = {
    concept: null,
    letsplay: null,
    other: null
  };

  /**
   * Put the loader, request for the videos, update the view
   */
  var updateCollapseTable = function(current_target) {
    $('#collapse' + current_target + ' .panel-body').html($('#template #loader').html());
    $.ajax({
      url: FRONTEND.ROUTES.SHOW_VIDEO_CATEGORY.replace('video_category_id_parameter', current_target) + '.json',
      method: 'GET',
      dataType: 'json',
      success: function(response) {
        if (response.length == 0) {
          $('#collapse' + current_target + ' .panel-body').html($('#template #empty-message').clone());
        } else {
          $('#collapse' + current_target + ' .panel-body').html("<div class='row'></div>");
          var current_row = $('#collapse' + current_target + ' .panel-body .row');

          for (var index in response) {
            if (index == 5) {
              current_row.append($('#template #see-more-thumb').html().replace('category_id', current_target));
              break;
            }

            var to_insert = $('#template #gallery').clone();

            $('#thumb_img', to_insert).attr('src', response[index].image_link);
            $('h3', to_insert).text(response[index].name);
            $('a', to_insert).attr('href', $('a', to_insert).attr('href').replace('video_id', response[index].id));

            current_row.append(to_insert);
          }

        }
      },
      error: function(response) {
        swal(FRONTEND.LANG.ERRORS.VIDEOS.COLLAPSE_TITLE, FRONTEND.LANG.ERRORS.VIDEOS.COLLAPSE_CONTENT, "warning");
      }
    });
  }

    /**
     * Clean the old collapsed table
     */
  var updateOldCollapseTable = function(_old_collapsed) {
    $('#collapse' + _old_collapsed).addClass('collapsing');
    $('#collapse' + _old_collapsed).removeClass('in');
    $('#collapse' + _old_collapsed).attr('aria-expanded', false);
    $('#heading-' + _old_collapsed + ' .panel-title a').addClass('collapsed')
    setTimeout(function() {
      $('#collapse' + _old_collapsed + ' .panel-body').html('');
        $('#collapse' + _old_collapsed).removeClass('collapsing');
    }, 350);
  }

  var bindCollapse = function(key, target) {
    target.click(function() {
      var current_target = target.closest('.panel-heading').attr('id').substr('heading-'.length);

      if (target.hasClass('collapsed')) {
        // If the link is collapsed
        if (old_collapsed[key]) {
          updateOldCollapseTable(old_collapsed[key]);
        }

        old_collapsed[key] = current_target;
        updateCollapseTable(current_target);
      } else {
        // If close the current collapsed table, clean the 'old_collapsed[key]' variable
        if (old_collapsed[key] === current_target) {
          old_collapsed[key] = null;
        }
      }
    });
  }

  /**
   * Bind every link of the collapse accordion
   */
  $('#categories-concept-container .panel-heading h4.panel-title a').each(function() {
    bindCollapse('concept', $(this));
  });
  $('#categories-letsplay-container .panel-heading h4.panel-title a').each(function() {
    bindCollapse('letsplay', $(this));
  });
  $('#categories-other-container .panel-heading h4.panel-title a').each(function() {
    bindCollapse('other', $(this));
  });
});

document.addEventListener("page:restore", function() {
  console.log('test');
});
