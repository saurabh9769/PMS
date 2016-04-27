jQuery(document).ready(function($) {

  $(".select2Field").select2({
      minimumInputLength: 1,
      minimumResultsForSearch: 10,
      ajax: {
          url: "/users",
          dataType: "json",
          type: "GET",
          data: function (params) {
            return {
              q: params.term // search term
              // page_limit: 2
            }
          },

          // results: function (data) {
          //   return {results: data.results};
          // }

          // processResults: function (data) {
          // 	 {
          // 			alert(data);
          //       $.map(data.results, function (item) {        
          // 	$(".select2-search__field").append({
          //           	name: item.name,
          //           	id: item.id
          //           })
          //       })
          //     };
          // }
          processResults: function (data) {
            var results = [];
            $.each(data.results, function (index, account) {
                results.push({
                    id: account.id,
                    text: account.name
                });
            });

            return {
                results: results
            };
          }
      }
  });

$('form').validate({
  rules: {
    'project[name]': {
      required: true
    },
    'project[description]': {
      required: true
    }
  },
  messages: {
    'project[name]': {
      required: "Name can't be blank"
    },
    'project[description]': {
      required: "Description can't be empty"
    }
  } 
});

});


