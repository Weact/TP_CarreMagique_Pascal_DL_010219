//TP Carre Magique
//Enonce: faire un programme qui affiche un carré magique, ce carré aura une dimension impaire, définit en constante.
//On pourra ainsi changer de carre en changeant la constante.
//Un carre magique est une table d'entier à 2 dimensons, dans tous les colonnes, les lignes et diagonales ont la même somme,
//Vous devez utiliser obligatoirement un tableau à 2 dimensions.

//Principe:
//-1er le premier entier 1, se trouve au nord du milieu de la table
//-2ème On place les chiffres de façon croissante en allant au Nord-Est de la position courante une seule fois.
//-3ème Si la la place est dejà prise, on se deplace au Nord-Oueste, jusqu'a trouver cette place libre.
//-4ème On s'arrête au carre de dimension (5x5),(7x7)
//-5ème Le tableau est considere comme spherique. Si on arrie au delà de la dernière colonne, on revient à la première colonne. Idem pour les lignes.

//3 Versions, un programme sans fonction et procedure.
//Ensuite, codage sur pascal.
//Ensuite, la V2 AVEC DES FONCTIONS ET PROC2DURES;
//Pour finir, la V3 pareil avec des types enregistrement

program CarreMag;
uses crt;
//BUT: Faire un carre magique, cf principe.
//ENTREE:
//SORTIE:

CONST
	MINTAB = 1;
	TAILLETAB = 5;
VAR
	nbMemoire,gen,x,y : INTEGER;
	board : array[MINTAB..TAILLETAB,MINTAB..TAILLETAB] of INTEGER;
	toggle : BOOLEAN;

//INITIALISATION
procedure initBoard();
var i,j : INTEGER;
begin

//INITIALISATION DU TABLEAU A 0
	for i := MINTAB to TAILLETAB do
	begin
		for j := MINTAB to TAILLETAB do
		begin
            		board[i,j] := 0;
    		end;
	end;
end;

//Procedure d'actualisation
procedure updateBoard();
var k,g,i,j : INTEGER;
begin

	while(toggle <> true)do
	begin
		clrscr;
		toggle := true;

		//Si la cellule du tableau est égal à 0, alors on fait +1 par rapport a la valeur d'avant grâce a nbMemoire.
        	if (board[x,y] = 0) then
        	begin
        		board[x,y] := nbMemoire;
        		nbMemoire := nbMemoire+1;
        		x := x + 1;
        	end
        	else
        	begin
        		x := x - 1;
        	end;

		//Verification quand X sort du tableau (éviter l'erreur 201!)
        	IF (x < MINTAB) then
        	begin
        		x:=TAILLETAB;
        	end;
        	if (x > TAILLETAB) then
        	begin
        		x := MINTAB;
        	end;

		//Vers le haut, dans tous les cas.
		y := y - 1;
		//Eviter l'erreur 201 sur y !
		if (y <= 0) then
		begin
			y := TAILLETAB;
		end;
		if (y > TAILLETAB) then
		begin
			y := MINTAB;
		end;

		//Ecriture du tableau
		for i := MINTAB to TAILLETAB do
        	begin
            		for j := MINTAB to TAILLETAB do
            		begin
                		if board[i,j] = 0 then
                		begin
                    			toggle := false ;
                		end;
			write(board[j,i]:5);
            		end;
       		writeln();
        	end;
	end;
end;

begin

	clrscr; //Clear screen

	nbMemoire := 1; //Initialiser le nombre en mémoire à 1.

	x := TAILLETAB DIV 2 + 1; //Positionner le X au nord du milieu.
    	y := TAILLETAB DIV 2; //Positionner le y au nord du milieu.
//(Position x,y = nord du milieu)

	//Initialisation (0,0,0,0,0,[...],0,0)
	initBoard();

	//Countdown
	Writeln('Jeu du carre magique : Commencement dans 2 secondes.');

	TextColor(red);
	Writeln('CARRE MAGIQUE ', TAILLETAB ,'x', TAILLETAB,'.');
	TextColor(white);

	Delay(2000);

	clrscr;

	//Affichage du tableau et actualisation, carré magique terminé.
	updateBoard();

	Readln();

end.

//PASCAL SANS PROCEDURE
{
	===================================================================================================
	===================================================================================================
	VERSION SANS PROCECDURE : PASCAL
	===================================================================================================
	===================================================================================================

	program CarreMag;
	uses crt;
	//BUT: Faire un carre magique, cf principe.
	//ENTREE:
	//SORTIE:

	CONST
	MINTAB = 1;
	TAILLETAB = 5;
	VAR
	nbMemoire,x,y,i,j : INTEGER;
	board : array[MINTAB..TAILLETAB,MINTAB..TAILLETAB] of INTEGER;
	toggle : BOOLEAN;

	BEGIN

	clrscr; //Clear screen

	nbMemoire := 1; //Initialiser le nombre en mémoire à 1.

	x := TAILLETAB DIV 2 + 1;   //Positionner le X au nord du milieu.
    y := TAILLETAB DIV 2;       //Positionner le y au nord du milieu.
                                //(Position x,y = nord du milieu)

	//Countdown
	Writeln('Jeu du carre magique : Commencement dans 2 secondes.');

	TextColor(red);
	Writeln('CARRE MAGIQUE ', TAILLETAB ,'x', TAILLETAB,'.');
	TextColor(white);

	Delay(2000);

	clrscr;


	//INITIALISATION
	for i := MINTAB to TAILLETAB do
	begin
	for j := MINTAB to TAILLETAB do
	begin
        board[i,j] := 0;
	end;
	end;

	//actualisation
	while(toggle <> true)do
	begin
	clrscr;
	toggle := true;

    //Si la cellule du tableau est égal à 0, alors on fait +1 par rapport a la valeur d'avant grâce a nbMemoire.
   	if (board[x,y] = 0) then
    begin
       	board[x,y] := nbMemoire;
       	nbMemoire := nbMemoire+1;
       	x := x + 1;
    end
    else
    begin
       	x := x - 1;
    end;

	//Verification quand X sort du tableau (éviter l'erreur 201!)
    if (x < MINTAB) then
    begin
        x:=TAILLETAB;
    end;
    if (x > TAILLETAB) then
    begin
       	x := MINTAB;
    end;

	//Vers le haut, dans tous les cas.
	y := y - 1;

	//Eviter l'erreur 201 sur y !
	if (y <= 0) then
	begin
	    y := TAILLETAB;
	end;
	if (y > TAILLETAB) then
	begin
		y := MINTAB;
	end;

	//Ecriture du tableau
	for i := MINTAB to TAILLETAB do
       	begin
           	for j := MINTAB to TAILLETAB do
            begin
               	if board[i,j] = 0 then
               	begin
                   	toggle := false ;
               	end;
		        write(board[j,i]:5);
           	end;
      	    writeln();
       	end;
    end;


           Readln();
	end.
}


//ALGO
{
	===================================================================================================
	===================================================================================================
	VERSION AVEC PROCEDURE : ALGO
	===================================================================================================
	===================================================================================================

	ALGORITHME CarMagiq
	//BUT: Faire un carre magique, cf principe.
	//ENTREE: tableau et entier ?
	//SORTIE: Le tableau du carré

	CONST
		MINTAB <- 1 : ENTIER
		TAILLETAB <- 15 : ENTIER
	VAR
		nbMemoire,x,y : ENTIER
		board : tableau[MINTAB..TAILLETAB,MINTAB..TAILLETAB] : ENTIER
		toggle : BOOLEEN

	//INITIALISATION
	PROCEDURE initBoard()
	var i,j : ENTIER
	DEBUT

	//INITIALISATION DU TABLEAU A 0
	POUR i <- MINTAB A TAILLETAB FAIRE
	DEBUT
		POUR j <- MINTAB A TAILLETAB FAIRE
		DEBUT
            	board[i,j] <- 0
    	FINPOUR
	FINPOUR
	FIN

	//PROCEDURE d'actualisation
	PROCEDURE updateBoard()
	var k,g,i,j : ENTIER
	DEBUT

	TANTQUE(toggle <> vrai)FAIRE
	DEBUT
		//EFFACER L'ÉCRAN (clrscr en pascal)
		toggle <- vrai

		//Si la cellule du tableau est égal à 0, alors on fait +1 par rapport a la valeur d'avant grâce a nbMemoire.
        	SI (board[x,y] = 0) ALORS
        	DEBUT
        		board[x,y] <- nbMemoire
        		nbMemoire <- nbMemoire+1
        		x <- x + 1
        	SINON
        	DEBUT
        		x <- x - 1
        	FINSI

		//Verification quand X sort du tableau (éviter l'erreur 201!)
        	SI (x < MINTAB) ALORS
        	DEBUT
        		x<-TAILLETAB
        	FINSI
        	SI (x > TAILLETAB) ALORS
        	DEBUT
        		x <- MINTAB
        	FINSI

		//Vers le haut, dans Aus les cas.
		y <- y - 1
		//Eviter l'erreur 201 sur y !
		SI (y <= 0) ALORS
		DEBUT
			y <- TAILLETAB
		FINSI
		SI (y > TAILLETAB) ALORS
		DEBUT
			y <- MINTAB
		FINSI

		//Ecriture du tableau
		POUR i <- MINTAB A TAILLETAB FAIRE
        	DEBUT
            		POUR j <- MINTAB A TAILLETAB FAIRE
            		DEBUT
                		SI board[i,j] = 0 ALORS
                		DEBUT
                    			toggle <- faux
                		FINSI
			ECRIRE(board[j,i]) //en pascal j'utiliserai ECRIRE(board[j,i]:5); :5 pour l'espacement.
            		FINPOUR
       		ECRIRE('') //saut de ligne
        	FINPOUR
	FINTANTQUE
	FIN

	DEBUT

	//Efface l'écran (clrscr en pascal)

	nbMemoire <- 1 //Initialiser le nombre en mémoire à 1.

		x <- TAILLETAB DIV 2 + 1 //Positionner le X au nord du milieu.
    	y <- TAILLETAB DIV 2 //Positionner le y au nord du milieu.
	//(Position x,y = nord du milieu)

	//Initialisation (0,0,0,0,0,[...],0,0)
	initBoard

	//Countdown
	ECRIRE('Jeu du carre magique : Commencement dans 2 secondes.')

	//Couleur rouge (TextColor(red)) en pascal
	ECRIRE('CARRE MAGIQUE ', TAILLETAB ,'x', TAILLETAB,'.')
	//Couleur blanche (TextColor(white)) en pascal

	//Attendre 2s Delay(2000) en pascal

	//Efface l'écran (clrscr en pascal)

	//Affichage du tableau et actualisation, carré magique terminé.
	updateBoard

	LIRE //Readln() en pascal

	FIN.
}

//ALGO
{
	===================================================================================================
	===================================================================================================
	VERSION SANS PROCEDURE : ALGO
	===================================================================================================
	===================================================================================================

	ALGORITHME CarMagiq
	//BUT: Faire un carre magique, cf principe.
	//ENTREE: tableau et entier ?
	//SORTIE: Le tableau du carré
	
	CONST
	    MINTAB = 1
	    TAILLETAB = 5
	VAR
	    nbMemoire,x,y,i,j : ENTIER
	    board : array[MINTAB..TAILLETAB,MINTAB..TAILLETAB] : ENTIER
	    toggle : BOOLEEN

	DEBUT

	//EFFACER L'ECRAN (clrscr en pascal)

	nbMemoire <- 1 //Initialiser le nombre en mémoire à 1.

	x <- TAILLETAB DIV 2 + 1   //Positionner le X au nord du milieu.
    y <- TAILLETAB DIV 2       //Positionner le y au nord du milieu.
                                //(Position x,y = nord du milieu)

	//Countdown
	ECRIRE('Jeu du carre magique : Commencement dans 2 secondes.')

	//TEXTE COULEUR ROUGE
	ECRIRE('CARRE MAGIQUE ', TAILLETAB ,'x', TAILLETAB,'.')
	//TEXTE COULEUR BLANCHE

	//Delay(2000) attendre 2 secondes en pascal

	//EFFACER L'ECRAN (clrscr en pascal)


	//INITIALISATION
	POUR i <- MINTAB to TAILLETAB FAIRE
	DEBUT
	POUR j <- MINTAB to TAILLETAB FAIRE
	DEBUT
        board[i,j] <- 0
	FINPOUR
	FINPOUR

	//actualisation
	TANTQUE(toggle <> vrai)FAIRE
	DEBUT
	//EFFACER L'ECRAN en pascal)
	toggle <- vrai

    //Si la cellule du tableau est égal à 0, alors on fait +1 par rapport a la valeur d'avant grâce a nbMemoire.
   	SI (board[x,y] = 0) ALORS
    DEBUT
       	board[x,y] <- nbMemoire
       	nbMemoire <- nbMemoire+1
       	x <- x + 1
    SINON
    DEBUT
       	x <- x - 1
    FINSI

	//Verification quand X sort du tableau (éviter l'erreur 201!)
    SI (x < MINTAB) ALORS
    DEBUT
        x<-TAILLETAB
    FINSI
    SI (x > TAILLETAB) ALORS
    DEBUT
       	x <- MINTAB
    FINSI

	//Vers le haut, dans tous les cas.
	y <- y - 1

	//Eviter l'erreur 201 sur y !
	SI (y <= 0) ALORS
	DEBUT
	    y <- TAILLETAB
	FINSI
	SI (y > TAILLETAB) ALORS
	DEBUT
		y <- MINTAB
	FINSI

	//Ecriture du tableau
	POUR i <- MINTAB to TAILLETAB FAIRE
       	DEBUT
           	POUR j <- MINTAB to TAILLETAB FAIRE
            DEBUT
               	SI board[i,j] = 0 ALORS
               	DEBUT
                   	toggle <- faux 
               	FINSI
		        ECRIRE(board[j,i]:5)
           	FINPOUR
      	    ECRIRE()
       	FINPOUR
    FINTANTQUE


           LIRE()
	FIN.
}
