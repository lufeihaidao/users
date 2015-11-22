// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require semantic-ui
//= require turbolinks
//= require messenger
//= require i18n
//= require i18n/translations
//= require medium-editor.min
//= require_tree .
Messenger.options = {
    extraClasses: 'messenger-fixed messenger-on-bottom messenger-on-right',
    theme: 'air'
}
function messenger(msg, type){
  Messenger().post({
    message: msg,
    type: type,
    showCloseButton: true
  });
}
Turbolinks.enableProgressBar();
