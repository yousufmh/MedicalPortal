$(document).ready(function () {
        $('#dt-filter-select').dataTable({
            initComplete: function () {
                this.api().columns().every( function () {
                    var column = this;
                    if(column.index() ==2 ||column.index() ==3 ){

                    var select = $('<select  class="browser-default form-control-sm m-l-300"></select> ')
                        .appendTo( $('#filter') )
                        .on( 'change', function () {
                             var val = $.fn.dataTable.util.escapeRegex(
                             $(this).val()
                              );

                            column.search( val ? '^'+val+'$' : '', true, false )
                            .draw();
                        });

                    column.data().unique().sort().each( function ( d, j ) {
                    select.append( '<option value="'+d+'">'+d+'</option>' )
                    } );}
                } );

           }
        });
});



