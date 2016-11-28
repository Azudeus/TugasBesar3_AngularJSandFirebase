    <%-- 
    Document   : chat
    Created on : Nov 27, 2016, 10:45:07 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div ng-app ='chat'>
    <div ng-controller ='chatController'>
        
    </div>
</div>

<script>
    var chatapp = angular.module("chat",[]);
    chatapp.openModal = openModal;
    chatapp.closeModal = closeModal;
    
    chatapp.controller()
    
    function openModal(id){   
            // open modal specified by id
        var modal = _.findWhere(modals, { id: id });
        modal.show();

    }
    
</script>
</html>