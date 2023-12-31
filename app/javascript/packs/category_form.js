
$(function() {
  function appendOption(category) {
    //変数の宣言
    let html = `<option value='${category.id}' data-category='${category.id}'>${category.name}</option>`;
    return html;
  }

  function appendChidrenBox(insertHTML) {
    let childrenSelectHtml = '-';
    childrenSelectHtml = `
      <div id='children-wrapper'>
        <select id='children-category' class='form-control' name='store[children_id]'>
          <option value='---' data-category='---'>---</option>
          ${insertHTML}
        </select>
        <i class='fas fa-chevron-down'></i>
      </div>
    `;
    $('.category-form').append(childrenSelectHtml);//クラスの要素に追加する()内
  }

  function appendGrandchidrenBox(insertHTML) {
    let grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `
      <div id='grandchildren-wrapper'>
        <select id='grandchildren-category' class='form-control' name='store[grandchildren_id]'>
          <option value='---' data-category='---'>---</option>
          ${insertHTML}
        </select>
        <i class='fas fa-chevron-down'></i>
      </div>
    `;
    $('.category-form').append(grandchildrenSelectHtml);
  }

  $('.parent_id_form').on('change', function() {
    let parentId = document.querySelector('.parent_id_form').value;//←IDがついているものを探し()内
    console.log({parentId})
    if (parentId != "-") {
      $.ajax({
        url: '/get_category/children',
        type: 'GET',
        data: {
          parent_id: parentId,
        },
        dataType: 'json',
      })
      //done(通信が成功した場合))
        .done(function(children) {
          console.log({children})
          $('#children-wrapper').remove();
          $('#grandchildren-wrapper').remove();
          let insertHTML = '';
          children.forEach(function(children) {
            insertHTML += appendOption(children);
          });
          appendChidrenBox(insertHTML);
        })
        .fail(function() {
          alert('カテゴリ取得に失敗しました');
        });
    } else {
      $('#children-wrapper').remove();
      $('#grandchildren-wrapper').remove();
    }
  });

  $('.category-form').on('change', '#children-category', function() {
    let childrenId = $('#children-category option:selected').data('category');
    if (childrenId != '---') {
      $.ajax({
        url: '/get_category/grandchildren',
        type: 'GET',
        data: {
          children_id: childrenId,
        },
        dataType: 'json',
      })
        .done(function(grandchildren) {
          console.log('grandchildren:'+grandchildren)
          if (grandchildren.length != 0) {
            $('#grandchildren-wrapper').remove();
            let insertHTML = '';
            grandchildren.forEach(function(grandchildren) {
              insertHTML += appendOption(grandchildren);
            });
            appendGrandchidrenBox(insertHTML);
          }
        })
        .fail(function() {
          alert('カテゴリ取得に失敗しました');
        });
    } else {
      $('#grandchildren-wrapper').remove();
    }
  });
});