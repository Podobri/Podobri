<script>
$('#country').change(function(evt){
 var url ='/Podobri/ajax/getCities/';
 var countryID = $(this).val();
 var urlToSend = url+countryID;
 $.ajax({
  url: urlToSend,
  type: 'GET',
  data: formData,
  dataType : "JSON",
  success: function(response) {
    for (var id in cities) {
             var opt = $('<option />');
             opt.val(id);
             opt.text(cities[id]);
             $('#cities').append(opt);
         }
  }
 });
});
</script>