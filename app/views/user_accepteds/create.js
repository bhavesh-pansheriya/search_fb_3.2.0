$("#flash_msg").empty();  // Make notice message empty before display new one.
$("#flash_msg").html("<%= escape_javascript(render :partial => '/shared/flashmsgbox') %>");  // For notice message.
