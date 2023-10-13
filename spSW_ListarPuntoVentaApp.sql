       
CREATE   proc [dbo].[spSW_ListarPuntoVentaApp]      
as      
Select      
 a.id as iCodigoPuntoEntrega,      
 a.NombrePuntoVenta as vNombrePuntoVenta,      
 a.Descripcion as vDescripcion,      
 a.HorarioDia as vHorarioDia,      
 a.HorarioHora as vHorarioHora,      
 a.Latitud as dLatitud,      
 a.Longitud as dLongitud,      
 IsNull(a.Direccion, '') as vDireccion,     
 ISNULL(a.CodUbigeo,'') as vCodUbigeo,    
 ISNULL(u.departamento,'') +'-'+ISNULL(u.provincia,'')+'-'+ISNULL(u.distrito,'') as vDesUbigeo     
From PuntoYuso  a inner join ubigeo u on a.codubigeo=u.codubigeo     
where Tipo = 'PDV'      
and Estado = 1 and FlagPuntoMedio = 0 and FlagEntrega = 1 