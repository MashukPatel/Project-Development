<!DOCTYPE html>
<html>
<head>
    <title>Get TD Value by ID</title>
    
    <script>
    function getData(){
    	var value1=document.getElementById("tdValue").innerText;
    	document.getElementById("tdValue1").innerText=value1;
    }
    </script>
</head>
<body>
    <h2>Get TD Value by ID</h2>

    <table>
        <tr>
            <td>
                <span id="tdValue">Cell 1</span>
            </td>
            <td> <h6 style="cursor: pointer;" onclick="getData()">click me</h6> </td>
            <td>
                <span id="tdValue1"></span>
            </td>
        </tr>
    </table>

    <script>
        // Get the value of the span inside the <td> with the id "tdValue"
        var tdValue = document.getElementById("tdValue").innerText;

        // Display the cell value in the console
        console.log("TD value:", tdValue);
    </script>
</body>
</html>