// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-datepicker
//= require bootstrap.select
//= require bootstrap.tagmanager
//= require bootstrap.timepicker
//= require bootstrap-modal
//= require bootstrap-modalmanager

    var browse_calender = function(a)
    {
        jQuery("table a").click(function(){
        val_at = $(this).attr('id');
        current_day = "day_"+val_at;
        if(a == 'true')
        {
          if ($("#"+current_day).val()== "" )
            {
                $("#"+current_day).val(val_at);
                $(this).addClass('set');
            }
        else
            {
                $("#"+current_day).val('');
                $(this).removeClass('set');
            }
        }
        
        })
    }

jQuery(document).ready(function(){
  $('#txtDateFrom,#txtDateTo').datepicker({
                changeYear: true,
                beforeShow: function (textbox, instance) {
                instance.dpDiv.css({
                    marginTop: (-textbox.offsetHeight) + 'px',
                    marginLeft: textbox.offsetWidth + 'px'
                });
                }
            });

 })


