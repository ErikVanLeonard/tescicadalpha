// ===========================================================================
// = Desarrollado por: Erik Leonardo Espinosa Machuca version alpha 0.1      =
// = Disclaimer (Todos Los derechos Reservados 2017-2018 (R) )               =
// = Prohibida su copia, reproducción, ingenieria inversa, distribucion sin  =
// = Autorizacion, decompilación, modificacion del codigo fuente, etc.       =
// =             DISTRIBUCIÓN UNICAMENTE CON FINES EDUCATIVOS                =
// ===========================================================================
unit Unit1;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,Grids, StdCtrls, math, Menus, ExtDlgs;
    type
  ttriangulo=record
  x: integer;
  y: integer;
  end;
type
  TForm1 = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    Archivo1: TMenuItem;
    GuardarImagen1: TMenuItem;
    Salirdelprograma1: TMenuItem;
    Manipulaci1: TMenuItem;
    LimpiarEspaciodeTrabajo1: TMenuItem;
    Forma1: TMenuItem;
    Lineadedospuntos1: TMenuItem;
    Polilinea1: TMenuItem;
    Bezier1: TMenuItem;
    Arco1: TMenuItem;
    Circulo1: TMenuItem;
    riangulo1: TMenuItem;
    Elipse1: TMenuItem;
    Grid1: TStringGrid;
    Grid2: TStringGrid;
    Color1: TMenuItem;
    Colordecontorno1: TMenuItem;
    Colorderelleno1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Ver1: TMenuItem;
    Cuadricula1: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Edit2: TEdit;
    Button3: TButton;
    Button4: TButton;
    Abririmagen1: TMenuItem;
    ColorDialog1: TColorDialog;
    ColorDialog2: TColorDialog;
    GuardarProyecto1: TMenuItem;
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Mover1Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Cuadricula1Click(Sender: TObject);
    procedure Colorderelleno1Click(Sender: TObject);
    procedure GuardarImagen1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LimpiarEspaciodeTrabajo1Click(Sender: TObject);
    procedure Colordecontorno1Click(Sender: TObject);
    procedure Bezier1Click(Sender: TObject);
    procedure Arco1Click(Sender: TObject);
    procedure Elipse1Click(Sender: TObject);
    procedure Circulo1Click(Sender: TObject);
    procedure riangulo1Click(Sender: TObject);
    procedure Polilinea1Click(Sender: TObject);
    procedure Lineadedospuntos1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure GuardarProyecto1Click(Sender: TObject);
    procedure Abririmagen1Click(Sender: TObject);
    procedure Salirdelprograma1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  clics,nb,ter,opera,renglon:Integer;
  escala: Real;
  color,color2:tcolor;
  cont1,cont2,cont3:Integer;
  r,g,b,rell1,rell2,rell3:Integer;
  c1,c2,c3:integer ;
  col1,col2,col3:integer;
  datos:Integer;

implementation

{$R *.dfm}
// paleta de colores
procedure TColorToRGB(Color: TColor; var R, G, B: integer);
begin
  if Color shr 24 = $FF then
       Color := GetSysColor(Color and $FF)
  else if Color shr 24 > $02 then
    Color := 0;
  R := Color;
  G := Color shr 8;
  B := Color shr 16;
  form1.Color:=clBtnFace;
end;

// fin paleta de colores


 // dda
procedure dda (x1,y1,x2,y2,c1,c2,c3:integer;image1:timage);
var
k:integer;
dx,dy:integer;
steps:integer;
x_mas,y_mas:real;
x,y:real;
begin
dx:=x2-x1;
dy:=y2-y1;
if abs(dx)>abs(dy) then
begin
steps:=abs(dx);
end
else
begin
steps:=abs(dy);
end;
x_mas:=dx/steps;
y_mas:=dy/steps;
x:=trunc(x1);
y:=trunc(y1);
for k:=1 to steps do
begin
x:=x+(x_mas);
y:=y+(y_mas);
image1.canvas.pixels[trunc(x),trunc(y)]:=rgb(c1,c2,c3);
end;
end;
// termina dda

// elipse
   procedure elipse(xc,yc,r1,r2,angi,angf,c1,c2,c3:Integer;image1:Timage);
var
i:Integer;
x,y,ang:Real;
begin
 ang:=angi;
 for i := angi*10 to angf*10  do
  begin
   x:=xc+r1*cos(degtorad(ang));
   y:=yc+r2*sin(degtorad(ang));
   image1.Canvas.Pixels[trunc(x),trunc(y)]:=rgb(c1,c2,c3);
   ang:=ang+0.1;
  end;
end;
// elipse termina

//circulo
     procedure circulo(angi,angf,c1,c2,c3:Integer;Grid1:TStringGrid;image1:Timage);
var
i:Integer;
begin
 for i := 1 to grid1.RowCount - 1 do
  begin
   elipse(strtoint(grid1.Cells[0,i-1]),
       strtoint(grid1.Cells[1,i-1]),
       (strtoint(grid1.Cells[0,i])-strtoint(grid1.Cells[0,i-1])),
       (strtoint(grid1.Cells[0,i])-strtoint(grid1.Cells[0,i-1])),
       angi,angf,c1,c2,c3,image1);
  end;
end;
//circulo termina

// elipse2
 procedure elipse2(angi,angf,c1,c2,c3:Integer;Grid1:TStringGrid;image1:Timage);
var
i:Integer;
begin
 for i := 1 to grid1.RowCount - 1 do
  begin
   elipse(strtoint(grid1.Cells[0,i-1]),
       strtoint(grid1.Cells[1,i-1]),
       (strtoint(grid1.Cells[0,i])-strtoint(grid1.Cells[0,i-1])),
       (strtoint(grid1.Cells[0,i])-strtoint(grid1.Cells[0,i-1]))+60,
       angi,angf,c1,c2,c3,image1);
  end;
end;
//elipse2 termina

// polilinea
procedure polilineas(c1,c2,c3:Integer;Grid1:TStringGrid;image1:Timage);
var
i:Integer;
begin
 for i := 1 to grid1.RowCount - 1 do
  begin
   dda(strtoint(grid1.Cells[0,i-1]),
       strtoint(grid1.Cells[1,i-1]),
       strtoint(grid1.Cells[0,i]),
       strtoint(grid1.Cells[1,i]),c1,c2,c3,image1);
  end;
  dda(strtoint(grid1.Cells[0,i-1]),
       strtoint(grid1.Cells[1,i-1]),
       strtoint(grid1.Cells[0,0]),
       strtoint(grid1.Cells[1,0]),c1,c2,c3,image1);
end;
// polilinea termina

//creacion bezier
procedure bezier(c1,c2,c3:Integer;grid1:TStringGrid;image1:timage);
var
ba:array [0..3] of tpoint;
begin
 image1.Canvas.Pen.Width:=1;
 image1.Canvas.Pen.Color:=rgb(c1,c2,c3);
 ba[0].x:=strtoint(grid1.Cells[0,0]);
 ba[0].y:=strtoint(grid1.Cells[1,0]);
 ba[1].x:=strtoint(grid1.Cells[0,1]);
 ba[1].y:=strtoint(grid1.Cells[1,1]);
 ba[2].x:=strtoint(grid1.Cells[0,2]);
 ba[2].y:=strtoint(grid1.Cells[1,2]);
 ba[3].x:=strtoint(grid1.Cells[0,3]);
 ba[3].y:=strtoint(grid1.Cells[1,3]);
image1.Canvas.PolyBezier(ba);
//bezier termina
 end;
 procedure triangulo (c1,c2,c3:Integer;grid1:TstringGrid;Image1:Timage);
 var
i:Integer;
begin
   for I := 1 to  grid1.RowCount - 1 do
   begin
     dda(strtoint(grid1.Cells[0,i-1]),
         strtoint(grid1.Cells[1,i-1]),
         strtoint(grid1.Cells[0,i]),
         strtoint(grid1.Cells[1,i]),c1,c2,c3,image1);
   end;
    dda(strtoint(grid1.Cells[0,i-1]),
         strtoint(grid1.Cells[1,i-1]),
         strtoint(grid1.Cells[0,0]),
         strtoint(grid1.Cells[1,0]),c1,c2,c3,image1);
end;



procedure TForm1.Abririmagen1Click(Sender: TObject);
    var
guardar:ttriangulo;
F:File of ttriangulo;
i:Integer;

begin
datos:=0;
AssignFile(F,ExtractFilePath(Application.ExeName)+ 'DIBUJO.tescicad');
Reset(F);
grid1.RowCount:=filesize(f);
for I := 0 to filesize(f)-1 do
  begin
    Seek(F, datos);
   BlockRead(F, guardar, 1);
    grid1.Cells[0,i]:=inttostr(guardar.x);
    grid1.Cells[1,i]:=inttostr(guardar.y);
     datos:=datos+1;
  end;
    CloseFile(F);
    triangulo(0,0,0,grid1,image1);
end;

procedure TForm1.Arco1Click(Sender: TObject);
begin
 Grid1.RowCount:=2;
 Grid2.RowCount:=2;
 nb:=7;
end;

procedure TForm1.Bezier1Click(Sender: TObject);
begin
Grid1.RowCount:=4;
Grid2.RowCount:=4;
nb:=9;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
opera:=1
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
opera:=4;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
opera:=5;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
opera:=7;
end;

procedure TForm1.Circulo1Click(Sender: TObject);
begin
Grid1.RowCount:=2;
 Grid2.RowCount:=2;
 nb:=4
end;

procedure TForm1.Colordecontorno1Click(Sender: TObject);
begin
 opera:=0;
  colordialog1.Execute() ;
  color:=colordialog1.color;
 tcolortorgb(color,c1,c2,c3);

end;

procedure TForm1.Colorderelleno1Click(Sender: TObject);
begin
  opera:=9;
 colordialog2.Execute() ;
 color2:=colordialog2.Color;
  tcolortorgb(color2,col1,col2,col3);

end;

procedure TForm1.Cuadricula1Click(Sender: TObject);
var
i:integer;
begin
begin  //desde aqui
with Image1 do
begin
Picture.Assign(nil);
for i:= 1 to Width div 20 do
begin
Canvas.MoveTo(20*i,0);
Canvas.LineTo(20*i,Height);
end;
for i:= 1 to Width div 20 do
begin
Canvas.MoveTo(0,20*i);
Canvas.LineTo(Width,20*i);
end;
end;
end;
end;

procedure TForm1.Elipse1Click(Sender: TObject);
begin
Grid1.RowCount:=2;
 Grid2.RowCount:=2;
 nb:=8;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
clics:=0;
nb:=0;
ter:=0;
opera:=0;
r:=0;
g:=0;
b:=0;
end;

procedure TForm1.GuardarImagen1Click(Sender: TObject);
begin
   Image1.Picture.SaveToFile('C:\Users\mreri\ctures\Imagen01.bmp');
   showmessage('Imagen guardada en la ruta C:\Users\mreri\Pictures\Imagen01.bmp');
end;

procedure TForm1.GuardarProyecto1Click(Sender: TObject);
  var
guardar:ttriangulo;
F: File of ttriangulo;
i:integer;

begin
AssignFile(F, ExtractFilePath( Application.ExeName) +  'DIBUJO.tescicad' );
Rewrite (F);
 for I := 0 to grid1.RowCount - 1 do
    begin
datos:=FileSize(F);
Seek(F, datos);
with guardar do
begin
    x:=strtoint(grid1.Cells[0,i]);
    y:=strtoint(grid1.Cells[1,i]);
end;
Write(F,guardar);
end;
   CloseFile(F);
       Application.MessageBox('Guardado',
			   'AUTOCAD', MB_OK)
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 var
dx,dy,i,ang,tx,ty:Integer;
xo,yo,xn,yn,dx1,dy1,escala:Real;
begin
            //Dibujar formas
    case opera of
  0:
   begin
    Grid1.Cells[0,clics]:=inttostr(x);
    Grid1.Cells[1,clics]:=inttostr(y);
    clics:=clics+1;
    if ((clics=3) and (nb=1)) then
     begin
      polilineas(cont1,cont2,cont3,grid1,image1);
      clics:=0;
     end;
    if ((clics=4) and (nb=2)) then
     begin
      polilineas(cont1,cont2,cont3,grid1,image1);
      clics:=0;
     end;
    if ((clics=4) and (nb=3)) then
     begin
      polilineas(cont1,cont2,cont3,grid1,image1);
      clics:=0;
     end;
    if ((clics=2) and (nb=4)) then
     begin
      circulo(0,360,cont1,cont2,cont3,grid1,image1);
      clics:=0;
    end;
    if ((clics=5) and (nb=5)) then
     begin
      polilineas(cont1,cont2,cont3,grid1,image1);
      clics:=0;
     end;
    if ((clics=2) and (nb=6)) then
     begin
      polilineas(cont1,cont2,cont3,grid1,image1);
      clics:=0;
     end;
    if ((clics=2) and (nb=7)) then
     begin
      circulo(180,360,cont1,cont2,cont3,grid1,image1);
      clics:=0;
     end;
    if ((clics=2) and (nb=8)) then
     begin
      elipse2(0,360,cont1,cont2,cont3,grid1,image1);
      clics:=0;
     end;
    if ((clics=4) and (nb=9)) then
     begin
      bezier(cont1,cont2,cont3,grid1,image1);
      clics:=0;
     end;
    if ((clics=6) and (nb=10)) then
     begin
      polilineas(cont1,cont2,cont3,grid1,image1);
      clics:=0;
     end;
    if ((clics=ter) and (nb=11)) then
     begin
      polilineas(cont1,cont2,cont3,grid1,image1);
      clics:=0;
     end;
   end;
   // dibujar formas fin

   1: //Dejar de mover
   begin
    opera:=0;
   end;
    2: //cortar
   begin
    for i := 0 to grid1.RowCount - 1 do
     begin
      dx:=x-strtoint(grid1.Cells[0,i]);
      dy:=y-strtoint(grid1.Cells[1,i]);
      if ((abs(dx)<5) and (abs(dy)<5)) then
       begin
        opera:=3;
        renglon:=i;
       end;
     end;
   end;
    3: // dejar de cortar
   begin
    opera:=0;
   end;
    4:// rotar
   begin
    //rota polilineas
    if ((nb=1)or(nb=2)or(nb=3)or(nb=5)or(nb=6)or(nb=10)or(nb=11)) then
     begin
      ang:=strtoint(edit2.Text);
      polilineas(255,255,255,grid1,image1);
      for i := 0 to grid1.RowCount - 1 do
       begin
        xo:=strtofloat(grid1.Cells[0,i]);
        yo:=strtofloat(grid1.Cells[1,i]);
        xn:=x+(xo-x)*cos(degtorad(ang))-(yo-y)*sin(degtorad(ang));
        yn:=y+(yo-y)*cos(degtorad(ang))+(xo-x)*sin(degtorad(ang));
        grid1.Cells[0,i]:=inttostr(trunc(xn));
        grid1.Cells[1,i]:=inttostr(trunc(yn));
       end;
      polilineas(cont1,cont2,cont3,grid1,image1);
     end;
    //rota circulo
    if nb=4 then
     begin
      ang:=strtoint(edit2.Text);
      circulo(0,360,255,255,255,grid1,image1);
      for i := 0 to grid1.RowCount - 1 do
       begin
        xo:=strtofloat(grid1.Cells[0,i]);
        yo:=strtofloat(grid1.Cells[1,i]);
        xn:=x+(xo-x)*cos(degtorad(ang))-(yo-y)*sin(degtorad(ang));
        yn:=y+(yo-y)*cos(degtorad(ang))+(xo-x)*sin(degtorad(ang));
        grid1.Cells[0,i]:=inttostr(trunc(xn));
        grid1.Cells[1,i]:=inttostr(trunc(yn));
       end;
      circulo(0,360,cont1,cont2,cont3,grid1,image1);
     end;
    //rota arco
    if nb=7 then
     begin
      ang:=strtoint(edit2.Text);
      circulo(180,360,255,255,255,grid1,image1);
      for i := 0 to grid1.RowCount - 1 do
       begin
        xo:=strtofloat(grid1.Cells[0,i]);
        yo:=strtofloat(grid1.Cells[1,i]);
        xn:=x+(xo-x)*cos(degtorad(ang))-(yo-y)*sin(degtorad(ang));
        yn:=y+(yo-y)*cos(degtorad(ang))+(xo-x)*sin(degtorad(ang));
        grid1.Cells[0,i]:=inttostr(trunc(xn));
        grid1.Cells[1,i]:=inttostr(trunc(yn));
       end;
      circulo(180,360,cont1,cont2,cont3,grid1,image1);
     end;
    //rota elipse
    if nb=8 then
     begin
      ang:=strtoint(edit2.Text);
      elipse2(0,360,255,255,255,grid1,image1);
      for i := 0 to grid1.RowCount - 1 do
       begin
        xo:=strtofloat(grid1.Cells[0,i]);
        yo:=strtofloat(grid1.Cells[1,i]);
        xn:=x+(xo-x)*cos(degtorad(ang))-(yo-y)*sin(degtorad(ang));
        yn:=y+(yo-y)*cos(degtorad(ang))+(xo-x)*sin(degtorad(ang));
        grid1.Cells[0,i]:=inttostr(trunc(xn));
        grid1.Cells[1,i]:=inttostr(trunc(yn));
       end;
      elipse2(0,360,cont1,cont2,cont3,grid1,image1);
     end;
    //rota curva bezier
    if nb=9 then
     begin
      ang:=strtoint(edit2.Text);
      bezier(255,255,255,grid1,image1);
      for i := 0 to grid1.RowCount - 1 do
       begin
        xo:=strtofloat(grid1.Cells[0,i]);
        yo:=strtofloat(grid1.Cells[1,i]);
        xn:=x+(xo-x)*cos(degtorad(ang))-(yo-y)*sin(degtorad(ang));
        yn:=y+(yo-y)*cos(degtorad(ang))+(xo-x)*sin(degtorad(ang));
        grid1.Cells[0,i]:=inttostr(trunc(xn));
        grid1.Cells[1,i]:=inttostr(trunc(yn));
       end;
      bezier(cont1,cont2,cont3,grid1,image1);
     end;
   end;
    5:   //reflexion en x
  begin
   //reflexion en x polilineas
   if ((nb=1)or(nb=2)or(nb=3)or(nb=5)or(nb=6)or(nb=10)or(nb=11)) then
    begin
     for i := 0 to grid1.RowCount - 1 do
      begin
       dx:=x-strtoint(grid1.Cells[0,i]);
       grid1.Cells[0,i]:=inttostr(x+dx);
      end;
     polilineas(cont1,cont2,cont3,grid1,image1);
    end;
   //reflexion en x circulo
   if nb=4 then
    begin
     for i := 0 to grid1.RowCount - 1 do
      begin
       dx:=x-strtoint(grid1.Cells[0,i]);
       grid1.Cells[0,i]:=inttostr(x+dx);
      end;
     circulo(0,360,cont1,cont2,cont3,grid1,image1);
    end;
   //reflexion en x arco
   if nb=7 then
    begin
     for i := 0 to grid1.RowCount - 1 do
      begin
       dx:=x-strtoint(grid1.Cells[0,i]);
       grid1.Cells[0,i]:=inttostr(x+dx);
      end;
     circulo(180,360,cont1,cont2,cont3,grid1,image1);
    end;
   //reflexion en x elipse
   if nb=8 then
    begin
     for i := 0 to grid1.RowCount - 1 do
      begin
       dx:=x-strtoint(grid1.Cells[0,i]);
       grid1.Cells[0,i]:=inttostr(x+dx);
      end;
     elipse2(0,360,cont1,cont2,cont3,grid1,image1);
    end;
   //reflexion en x curva bezier
   if nb=9 then
    begin
     for i := 0 to grid1.RowCount - 1 do
      begin
       dx:=x-strtoint(grid1.Cells[0,i]);
       grid1.Cells[0,i]:=inttostr(x+dx);
      end;
     bezier(cont1,cont2,cont3,grid1,image1);
    end;
  end;
  6: // reflexion en y
  begin
   //reflexion en y polilineas
   if ((nb=1)or(nb=2)or(nb=3)or(nb=5)or(nb=6)or(nb=10)or(nb=11)) then
    begin
     for i := 0 to grid1.RowCount - 1 do
      begin
       dy:=y-strtoint(grid1.Cells[1,i]);
       grid1.Cells[1,i]:=inttostr(y+dy);
      end;
     polilineas(cont1,cont2,cont3,grid1,image1);
    end;
   //reflexion en y circulo
   if nb=4 then
    begin
     for i := 0 to grid1.RowCount - 1 do
      begin
       dy:=y-strtoint(grid1.Cells[1,i]);
       grid1.Cells[1,i]:=inttostr(y+dy);
      end;
     circulo(0,360,cont1,cont2,cont3,grid1,image1);
    end;
   //reflexion en y arco
   if nb=7 then
    begin
     for i := 0 to grid1.RowCount - 1 do
      begin
       dy:=y-strtoint(grid1.Cells[1,i]);
       grid1.Cells[1,i]:=inttostr(y+dy);
      end;
     circulo(180,360,cont1,cont2,cont3,grid1,image1);
    end;
   //reflexion en y elipse
   if nb=8 then
    begin
     for i := 0 to grid1.RowCount - 1 do
      begin
       dy:=y-strtoint(grid1.Cells[1,i]);
       grid1.Cells[1,i]:=inttostr(y+dy);
      end;
     elipse2(0,360,cont1,cont2,cont3,grid1,image1);
    end;
   //reflexion en y curva bezier
   if nb=9 then
    begin
     for i := 0 to grid1.RowCount - 1 do
      begin
       dy:=y-strtoint(grid1.Cells[1,i]);
       grid1.Cells[1,i]:=inttostr(y+dy);
      end;
     bezier(cont1,cont2,cont3,grid1,image1);
    end;
  end;
  7: // 3d paralelo
  begin
   //3d polilineas
   if ((nb=1)or(nb=2)or(nb=3)or(nb=5)or(nb=6)or(nb=10)or(nb=11)) then
    begin
     tx:=x-strtoint(grid1.Cells[0,0]);
     ty:=y-strtoint(grid1.Cells[1,0]);
     for i := 0 to grid1.RowCount - 1 do
      begin
       grid2.Cells[0,i]:=inttostr(strtoint(grid1.Cells[0,i])+tx);
       grid2.Cells[1,i]:=inttostr(strtoint(grid1.Cells[1,i])+ty);
      end;
     polilineas(cont1,cont2,cont3,grid2,image1);
     for i := 0 to grid1.RowCount - 1 do
      begin
      dda(strtoint(grid1.Cells[0,i]),
          strtoint(grid1.Cells[1,i]),
          strtoint(grid2.Cells[0,i]),
          strtoint(grid2.Cells[1,i]),cont1,cont2,cont3,image1);
      end;
    end;
   //3d circulo
   if nb=4 then
    begin
     tx:=x-strtoint(grid1.Cells[0,0]);
     ty:=y-strtoint(grid1.Cells[1,0]);
     for i := 0 to grid1.RowCount - 1 do
      begin
       grid2.Cells[0,i]:=inttostr(strtoint(grid1.Cells[0,i])+tx);
       grid2.Cells[1,i]:=inttostr(strtoint(grid1.Cells[1,i])+ty);
      end;
     circulo(0,360,cont1,cont2,cont3,grid2,image1);
     for i := 0 to grid1.RowCount - 1 do
      begin
      dda(strtoint(grid1.Cells[0,i]),
          strtoint(grid1.Cells[1,i]),
          strtoint(grid2.Cells[0,i]),
          strtoint(grid2.Cells[1,i]),cont1,cont2,cont3,image1);
      end;
    end;
   //3d arco
   if nb=7 then
    begin
     tx:=x-strtoint(grid1.Cells[0,0]);
     ty:=y-strtoint(grid1.Cells[1,0]);
     for i := 0 to grid1.RowCount - 1 do
      begin
       grid2.Cells[0,i]:=inttostr(strtoint(grid1.Cells[0,i])+tx);
       grid2.Cells[1,i]:=inttostr(strtoint(grid1.Cells[1,i])+ty);
      end;
     circulo(180,360,cont1,cont2,cont3,grid2,image1);
     for i := 0 to grid1.RowCount - 1 do
      begin
      dda(strtoint(grid1.Cells[0,i]),
          strtoint(grid1.Cells[1,i]),
          strtoint(grid2.Cells[0,i]),
          strtoint(grid2.Cells[1,i]),cont1,cont2,cont3,image1);
      end;
    end;
   //3d elipse
   if nb=8 then
    begin
     tx:=x-strtoint(grid1.Cells[0,0]);
     ty:=y-strtoint(grid1.Cells[1,0]);
     for i := 0 to grid1.RowCount - 1 do
      begin
       grid2.Cells[0,i]:=inttostr(strtoint(grid1.Cells[0,i])+tx);
       grid2.Cells[1,i]:=inttostr(strtoint(grid1.Cells[1,i])+ty);
      end;
     elipse2(0,360,cont1,cont2,cont3,grid2,image1);
     for i := 0 to grid1.RowCount - 1 do
      begin
      dda(strtoint(grid1.Cells[0,i]),
          strtoint(grid1.Cells[1,i]),
          strtoint(grid2.Cells[0,i]),
          strtoint(grid2.Cells[1,i]),cont1,cont2,cont3,image1);
      end;
    end;
   //3d curva bezier
   if nb=9 then
    begin
     tx:=x-strtoint(grid1.Cells[0,0]);
     ty:=y-strtoint(grid1.Cells[1,0]);
     for i := 0 to grid1.RowCount - 1 do
      begin
       grid2.Cells[0,i]:=inttostr(strtoint(grid1.Cells[0,i])+tx);
       grid2.Cells[1,i]:=inttostr(strtoint(grid1.Cells[1,i])+ty);
      end;
     bezier(cont1,cont2,cont3,grid2,image1);
     for i := 0 to grid1.RowCount - 1 do
      begin
      dda(strtoint(grid1.Cells[0,i]),
          strtoint(grid1.Cells[1,i]),
          strtoint(grid2.Cells[0,i]),
          strtoint(grid2.Cells[1,i]),cont1,cont2,cont3,image1);
      end;
    end;
  end;

  9:// rellenar
  begin

   image1.Canvas.FloodFill(x,y,rgb(cont1,cont2,cont3),FsBorder);
   image1.Canvas.Brush.Color:=rgb(rell1,rell2,rell3);
  end;
end;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
Tx,Ty,I:integer;
begin
case opera of

1:
  begin
     Tx:=x-strtoint(grid1.cells[0,0]);
     Ty:=y-strtoint(grid1.cells[1,0]);

       for I := 0 to grid1.RowCount - 1 do
         begin
          grid1.Cells[0,i]:=inttostr(strtoint(grid1.Cells[0,i])+Tx);
          grid1.Cells[1,i]:=inttostr(strtoint(grid1.Cells[1,i])+Ty);
         end;
         image1.Picture:=nil;
         polilineas(0,0,0,grid1,image1);

  end;
end;
end;

procedure TForm1.LimpiarEspaciodeTrabajo1Click(Sender: TObject);
begin
clics:=0;
Grid1.rows [0].Clear;
grid1.rows[1].Clear;
image1.Picture := nil;
opera:=0;
end;

procedure TForm1.Lineadedospuntos1Click(Sender: TObject);
begin
 Grid1.RowCount:=2;
 Grid2.RowCount:=2;
 nb:=6;
end;

procedure TForm1.Mover1Click(Sender: TObject);
begin
opera:=1
end;

procedure TForm1.Polilinea1Click(Sender: TObject);
begin
ter:=strtoint(inputbox('Polilinea','Numero de puntos:','2'));
 Grid1.RowCount:=ter;
 Grid2.RowCount:=ter;
 nb:=11;
end;

procedure TForm1.riangulo1Click(Sender: TObject);
begin
Grid1.RowCount:=3;
Grid2.RowCount:=3;
nb:=1;
end;

procedure TForm1.Salirdelprograma1Click(Sender: TObject);
begin
Form1.Close;
end;

end.

