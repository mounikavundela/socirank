
        <form action="HTMLSearchSave" id="formAction" method="get">

           
                    <div align="center">
                        
                        
                        <table style='margin-top:50px;'>
	<caption> <strong> <font face=arial size=10 color=blue>
<tr><td><select name='combo' id='combo' style='visibility:hidden;'>
	
                        <option value='Search'>Search</option>
                        </select></td><td></td>
	<tr                        <td><img src="charts/1234.jpg"></td>>


                        </tr> 

</a></td>
                        </tr>
</table>
                    </div>
                    
                    <div align="center" id="display1" style="height:50px;">


                    </div>
                    <div style="margin-top:20px;height:1500px;" id="searchResult">
                    </div>
             
                <div id="footer" align="center">
               
                </div>
                <SCRIPT>
                    function fade(div_id, button)
                    {
                        //alert("hello");
                        if(button == 'FadeOut') {
                            $('#'+div_id).fadeOut('slow');
                            $('#footer').fadeOut('slow');
                            button.value = 'FadeIn';
                        }
                        else if(button == 'FadeIn'){
                            document.getElementById('menubar').style.visibility = "visible"
                            document.getElementById('footer').style.visibility = "visible"
                            $('#'+div_id).fadeIn('slow');
                            $('#footer').fadeIn('slow');
                            button.value = 'FadeOut';
                        }
                    }
                </SCRIPT>
            

        </form>
        </div>
    </body>
</html>
