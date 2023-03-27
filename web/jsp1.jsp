<%-- 
    Document   : jsp1
    Created on : 9 mar 2023, 13:10:58
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="p-3 mb-2 bg-secondary text-white">
            <h1>Programita de numeros</h1>
        </div>
        <div class="card">
          <div class="card text-white bg-dark mb-3">
            <div class="container-lg">
                <div class="row align-items-start">
                  <div class="col">
                    <h1>Numero</h1>
                  </div>
                  <div class="col">
                    <h1>Valor</h1>
                  </div>
                  <div class="col">
                    <h1>Comparación con 50</h1>
                  </div>
                </div>
            </div>
          </div>
        
        
        <%
            int suma = 0, rest = 0, multi = 0, may = 0, men =0,prim = 0;
            float prom = 0;
            
            String num =request.getParameter("num");
            num = null;
            int cuan = Integer.parseInt(num);
            for (int i = 0; i < Integer.parseInt(num); i++) {
                    
                
        %>
        <div class="card">
          <div class="card text-white bg-success mb-3">
            <div class="container-lg">
                <div class="row align-items-start">
                  
        <%
            int y = (int)(Math.random()*100);
            if(y <50)
            {
        %>
                <div class="col">
                    <h1>Numero <%= i+1%> </h1>
                  </div>
                  <div class="col">
                    <h1><%= y%></h1>
                  </div>
                  <div class="col">
                    <h1>Menor a 50</h1>
                  </div>
                </div>            
          </div>
        </div>
                
        
        <%
            }
            else
            {
        %>
            <div class="col">
                    <h1>Numero <%= i+1%></h1>
                  </div>
                  <div class="col">
                    <h1><%= y%></h1>
                  </div>
                  <div class="col">
                    <h1>Mayor o igual a 50</h1>
                  </div>
                </div>            
          </div>
        </div>    
        
        
        <%
             }
        %>
         
        
        <%
            if (i == 0){
                prim = y;
                multi = prim;
            }
            else{
                multi = multi * y;
            }
            
            
            suma = suma + y; 
            rest = prim - y;
            
            
            
            may = y;
            if (may < y) {
                    may = y;
            }
            else 
               men = y;
            
        %>
        
        
         <%
             }
            prom = suma/cuan;
         %>
         
         <p>
            <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                Suma
            </a>
            <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample1" role="button" aria-expanded="false" aria-controls="collapseExample">
                Resta
            </a>
             <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="false" aria-controls="collapseExample">
                Multiplicación
            </a>          
            <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample4" role="button" aria-expanded="false" aria-controls="collapseExample">
                Promedio
            </a>
        </p>
        <div class="collapse" id="collapseExample">
          <div class="card card-body">
            La suma de los numeros es: <%= suma%>
          </div>
        </div>
        <div class="collapse" id="collapseExample1">
          <div class="card card-body">
            La resta de los numeros es: <%= rest%>
          </div>
        </div>
        <div class="collapse" id="collapseExample2">
          <div class="card card-body">
            La multiplicación de los numeros es: <%= multi%>
          </div>
        </div>
        <div class="collapse" id="collapseExample4">
          <div class="card card-body">
            El promedio de los numeros es: <%= prom%>
          </div>
        </div>           
    </body>
</html>
