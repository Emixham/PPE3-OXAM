DROP DATABASE IF EXISTS gestionRS;

CREATE DATABASE IF NOT EXISTS gestionRS;
USE gestionRS;
# -----------------------------------------------------------------------------
#       TABLE : MATERIEL
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MATERIEL
 (
   IDMATERIEL INTEGER NOT NULL AUTO_INCREMENT ,
   NOM CHAR(32) NULL  
   , PRIMARY KEY (IDMATERIEL) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PRIX
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PRIX
 (
   IDPRIX INTEGER NOT NULL AUTO_INCREMENT 
   , PRIMARY KEY (IDPRIX) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : DUREE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DUREE
 (
   IDDUREE INTEGER NOT NULL AUTO_INCREMENT ,
   DUREE CHAR(32) NULL  
   , PRIMARY KEY (IDDUREE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ORGANISME
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ORGANISME
 (
   IDORG INTEGER NOT NULL AUTO_INCREMENT ,
   NOMORG CHAR(32) NULL  ,
   NOMUTI CHAR(32) NULL  ,
   ADRESSE CHAR(255) NULL  ,
   CP INTEGER NULL  ,
   VILLE CHAR(32) NULL  ,
   MAIL CHAR(255) NULL  ,
   TEL INTEGER NULL  ,
   RESIDENT BOOL NULL  
   , PRIMARY KEY (IDORG) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CATEGORIE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CATEGORIE
 (
   IDCATEGORIE INTEGER NOT NULL AUTO_INCREMENT ,
   NOMCATEGORIE CHAR(32) NULL  ,
   NBPLACES INTEGER NULL  
   , PRIMARY KEY (IDCATEGORIE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SALLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SALLE
 (
   IDSALLE INTEGER NOT NULL AUTO_INCREMENT ,
   IDCATEGORIE INTEGER NOT NULL  ,
   NOMSALLE CHAR(32) NULL  ,
   DISPONIBLE BOOL NULL  
   , PRIMARY KEY (IDSALLE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE SALLE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_SALLE_CATEGORIE
     ON SALLE (IDCATEGORIE ASC);

# -----------------------------------------------------------------------------
#       TABLE : RESERVATION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS RESERVATION
 (
   IDRESERVATION INTEGER NOT NULL AUTO_INCREMENT ,
   IDDUREE INTEGER NOT NULL  ,
   IDSALLE INTEGER NOT NULL  ,
   IDORG INTEGER NOT NULL  ,
   VALIDER BOOL NULL  ,
   OBJET CHAR(255) NULL  ,
   NBPERS INTEGER NULL  ,
   NBPERSHAND INTEGER NULL  ,
   MESSAGE CHAR(255) NULL  ,
   DATERESERV DATE NULL  
   , PRIMARY KEY (IDRESERVATION) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE RESERVATION
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_RESERVATION_DUREE
     ON RESERVATION (IDDUREE ASC);

CREATE  INDEX I_FK_RESERVATION_SALLE
     ON RESERVATION (IDSALLE ASC);

CREATE  INDEX I_FK_RESERVATION_ORGANISME
     ON RESERVATION (IDORG ASC);

# -----------------------------------------------------------------------------
#       TABLE : CONNEXION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CONNEXION
 (
   IDCO INTEGER NOT NULL AUTO_INCREMENT ,
   IDORG INTEGER NOT NULL  ,
   UTILISATEUR CHAR(32) NULL  ,
   MDP CHAR(32) NULL  
   , PRIMARY KEY (IDCO) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CONNEXION
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CONNEXION_ORGANISME
     ON CONNEXION (IDORG ASC);

# -----------------------------------------------------------------------------
#       TABLE : APPARTENIR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS APPARTENIR
 (
   IDCATEGORIE INTEGER NOT NULL  ,
   IDPRIX INTEGER NOT NULL  
   , PRIMARY KEY (IDCATEGORIE,IDPRIX) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE APPARTENIR
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_APPARTENIR_CATEGORIE
     ON APPARTENIR (IDCATEGORIE ASC);

CREATE  INDEX I_FK_APPARTENIR_PRIX
     ON APPARTENIR (IDPRIX ASC);

# -----------------------------------------------------------------------------
#       TABLE : AJOUTER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS AJOUTER
 (
   IDRESERVATION INTEGER NOT NULL  ,
   IDMATERIEL INTEGER NOT NULL  
   , PRIMARY KEY (IDRESERVATION,IDMATERIEL) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE AJOUTER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_AJOUTER_RESERVATION
     ON AJOUTER (IDRESERVATION ASC);

CREATE  INDEX I_FK_AJOUTER_MATERIEL
     ON AJOUTER (IDMATERIEL ASC);

# -----------------------------------------------------------------------------
#       TABLE : RATTACHER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS RATTACHER
 (
   IDMATERIEL INTEGER NOT NULL  ,
   IDSALLE INTEGER NOT NULL  
   , PRIMARY KEY (IDMATERIEL,IDSALLE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE RATTACHER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_RATTACHER_MATERIEL
     ON RATTACHER (IDMATERIEL ASC);

CREATE  INDEX I_FK_RATTACHER_SALLE
     ON RATTACHER (IDSALLE ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE SALLE 
  ADD FOREIGN KEY FK_SALLE_CATEGORIE (IDCATEGORIE)
      REFERENCES CATEGORIE (IDCATEGORIE) ;


ALTER TABLE RESERVATION 
  ADD FOREIGN KEY FK_RESERVATION_DUREE (IDDUREE)
      REFERENCES DUREE (IDDUREE) ;


ALTER TABLE RESERVATION 
  ADD FOREIGN KEY FK_RESERVATION_SALLE (IDSALLE)
      REFERENCES SALLE (IDSALLE) ;


ALTER TABLE RESERVATION 
  ADD FOREIGN KEY FK_RESERVATION_ORGANISME (IDORG)
      REFERENCES ORGANISME (IDORG) ;


ALTER TABLE CONNEXION 
  ADD FOREIGN KEY FK_CONNEXION_ORGANISME (IDORG)
      REFERENCES ORGANISME (IDORG) ;


ALTER TABLE APPARTENIR 
  ADD FOREIGN KEY FK_APPARTENIR_CATEGORIE (IDCATEGORIE)
      REFERENCES CATEGORIE (IDCATEGORIE) ;


ALTER TABLE APPARTENIR 
  ADD FOREIGN KEY FK_APPARTENIR_PRIX (IDPRIX)
      REFERENCES PRIX (IDPRIX) ;


ALTER TABLE AJOUTER 
  ADD FOREIGN KEY FK_AJOUTER_RESERVATION (IDRESERVATION)
      REFERENCES RESERVATION (IDRESERVATION) ;


ALTER TABLE AJOUTER 
  ADD FOREIGN KEY FK_AJOUTER_MATERIEL (IDMATERIEL)
      REFERENCES MATERIEL (IDMATERIEL) ;


ALTER TABLE RATTACHER 
  ADD FOREIGN KEY FK_RATTACHER_MATERIEL (IDMATERIEL)
      REFERENCES MATERIEL (IDMATERIEL) ;


ALTER TABLE RATTACHER 
  ADD FOREIGN KEY FK_RATTACHER_SALLE (IDSALLE)
      REFERENCES SALLE (IDSALLE) ;

