
function display_notice(message){
  document.getElementById('notice_area').insertAdjacentHTML('afterbegin', `
    <div aria-live="polite" aria-atomic="true" class="position-relative">
      <div class="toast m-3" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
          <div id="notice_body" class="toast-body">${message}</div>
          <button type="button" class="btn-close  me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
      </div>
    </div>
  `);

  new bootstrap.Toast(document.getElementById('notice_area').children[0].children[0]).show();
}

document.addEventListener('turbo:before-fetch-response', function(event){

  var json = JSON.parse(
    event.detail.fetchResponse.header('X-Flash-Messages')
  )

  // メッセージを表示する
  for(let key in json){
  // ↓ これがflashメッセージを出すfunction
    display_notice(
      decodeURI(json[key])
    )
  }
});