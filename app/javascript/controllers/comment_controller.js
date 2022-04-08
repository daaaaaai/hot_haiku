import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="hike-like"
export default class extends Controller {
  static targets = [ "_modal" ]

  connect() {
  }

  set_haiku_id(){
    document.getElementById('comment_haiku_id').setAttribute("value", this.element.dataset.haiku_id)
  }

  show_modal() {
    this.set_haiku_id()

    // modal.showより先にイベントリスナーを登録しないと動かない気がするあとで確認する
    document.addEventListener('turbo:submit-end', (event) => {
      // todo 失敗時にエラーメッセージを表示する
      if (event.detail.success) {
        this.hide_modal();
      }
    });

    this.modal.show();
  }

  hide_modal() {
    this.modal.hide();
  }

  // このあたりを参考にしています
  // https://stackoverflow.com/questions/71187374/memoize-a-bootstrap5-modal-inside-a-stimulus-controller

  get modal() {
    if (this._modal == undefined) {
      console.log("set modal")
      this._modal = new bootstrap.Modal(document.getElementById('comment_modal'));
    }
    return this._modal
  }
}
