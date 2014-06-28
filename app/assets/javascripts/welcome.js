 $('#post_state_id').on("change", function(){
    var stateSelection = $('#post_state_id').val();
    $.post('')
    $("a[href='/users/new']").after("<ol><%= congress_by_state(" + stateSelection + ").each do |p| %><li><%= p.first_name %> <%= p.last_name %>: <%= p.title %> - <%= p.party %></li><% end %></ol>");
  });
