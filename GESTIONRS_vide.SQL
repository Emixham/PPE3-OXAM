DROP DATABASE IF EXISTS gestionrs;

CREATE DATABASE IF NOT EXISTS gestionrs;
USE gestionrs;
# -----------------------------------------------------------------------------
#       TABLE : DEMANDEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DEMANDEUR
 (
   IDD INTEGER(2) NOT NULL AUTO_INCREMENT ,
   IDORG INTEGER(2) NOT NULL  ,
   NOMU VARCHAR(128) NULL  ,
   ADRESSEMAIL VARCHAR(128) NULL  ,
   MDP CHAR(32) NULL  
   , PRIMARY KEY (IDD) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE DEMANDEUR
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_DEMANDEUR_ORGANISME
     ON DEMANDEUR (IDORG ASC);

# -----------------------------------------------------------------------------
#       TABLE : MATERIEL
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MATERIEL
 (
   IDMATERIEL INTEGER(2) NOT NULL AUTO_INCREMENT ,
   NOM CHAR(32) NULL  
   , PRIMARY KEY (IDMATERIEL) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : DUREE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DUREE
 (
   IDDUREE INTEGER(2) NOT NULL AUTO_INCREMENT ,
   DUREE CHAR(32) NULL  
   , PRIMARY KEY (IDDUREE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CATEGR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CATEGR
 (
   NUMCAT INTEGER(2) NOT NULL AUTO_INCREMENT ,
   NOMCATR VARCHAR(128) NULL  
   , PRIMARY KEY (NUMCAT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ORGANISME
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ORGANISME
 (
   IDORG INTEGER(2) NOT NULL AUTO_INCREMENT ,
   NUMCAT INTEGER(2) NOT NULL  ,
   NOMORG CHAR(32) NULL  ,
   NOMUTI CHAR(32) NULL  ,
   ADRESSE CHAR(255) NULL  ,
   CP INTEGER(2) NULL  ,
   VILLE CHAR(32) NULL  ,
   MAIL CHAR(255) NULL  ,
   TEL INTEGER(2) NULL  
   , PRIMARY KEY (IDORG) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ORGANISME
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ORGANISME_CATEGR
     ON ORGANISME (NUMCAT ASC);

# -----------------------------------------------------------------------------
#       TABLE : CATEGORIE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CATEGORIE
 (
   IDCATEGORIE INTEGER(2) NOT NULL AUTO_INCREMENT ,
   NOMCATEGORIE CHAR(32) NULL  ,
   NBPLACES INTEGER(2) NULL  
   , PRIMARY KEY (IDCATEGORIE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SALLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SALLE
 (
   IDSALLE INTEGER(2) NOT NULL AUTO_INCREMENT ,
   IDCATEGORIE INTEGER(2) NOT NULL  ,
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
   IDRESERVATION INTEGER(2) NOT NULL AUTO_INCREMENT ,
   IDDUREE INTEGER(2) NOT NULL  ,
   IDSALLE INTEGER(2) NOT NULL  ,
   IDORG INTEGER(2) NOT NULL  ,
   VALIDER BOOL NULL  ,
   OBJET CHAR(255) NULL  ,
   NBPERS INTEGER(2) NULL  ,
   NBPERSHAND INTEGER(2) NULL  ,
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
#       TABLE : TARIFER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TARIFER
 (
   NUMCAT INTEGER(2) NOT NULL  ,
   IDCATEGORIE INTEGER(2) NOT NULL  ,
   IDDUREE INTEGER(2) NOT NULL  ,
   PRIX DECIMAL(10,2) NULL  
   , PRIMARY KEY (NUMCAT,IDCATEGORIE,IDDUREE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE TARIFER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_TARIFER_CATEGR
     ON TARIFER (NUMCAT ASC);

CREATE  INDEX I_FK_TARIFER_CATEGORIE
     ON TARIFER (IDCATEGORIE ASC);

CREATE  INDEX I_FK_TARIFER_DUREE
     ON TARIFER (IDDUREE ASC);

# -----------------------------------------------------------------------------
#       TABLE : CONTENIR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CONTENIR
 (
   IDMATERIEL INTEGER(2) NOT NULL  ,
   IDSALLE INTEGER(2) NOT NULL  
   , PRIMARY KEY (IDMATERIEL,IDSALLE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CONTENIR
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CONTENIR_MATERIEL
     ON CONTENIR (IDMATERIEL ASC);

CREATE  INDEX I_FK_CONTENIR_SALLE
     ON CONTENIR (IDSALLE ASC);

# -----------------------------------------------------------------------------
#       TABLE : AJOUTER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS AJOUTER
 (
   IDRESERVATION INTEGER(2) NOT NULL  ,
   IDMATERIEL INTEGER(2) NOT NULL  
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
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE DEMANDEUR 
  ADD FOREIGN KEY FK_DEMANDEUR_ORGANISME (IDORG)
      REFERENCES ORGANISME (IDORG) ;


ALTER TABLE ORGANISME 
  ADD FOREIGN KEY FK_ORGANISME_CATEGR (NUMCAT)
      REFERENCES CATEGR (NUMCAT) ;


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


ALTER TABLE TARIFER 
  ADD FOREIGN KEY FK_TARIFER_CATEGR (NUMCAT)
      REFERENCES CATEGR (NUMCAT) ;


ALTER TABLE TARIFER 
  ADD FOREIGN KEY FK_TARIFER_CATEGORIE (IDCATEGORIE)
      REFERENCES CATEGORIE (IDCATEGORIE) ;


ALTER TABLE TARIFER 
  ADD FOREIGN KEY FK_TARIFER_DUREE (IDDUREE)
      REFERENCES DUREE (IDDUREE) ;


ALTER TABLE CONTENIR 
  ADD FOREIGN KEY FK_CONTENIR_MATERIEL (IDMATERIEL)
      REFERENCES MATERIEL (IDMATERIEL) ;


ALTER TABLE CONTENIR 
  ADD FOREIGN KEY FK_CONTENIR_SALLE (IDSALLE)
      REFERENCES SALLE (IDSALLE) ;


ALTER TABLE AJOUTER 
  ADD FOREIGN KEY FK_AJOUTER_RESERVATION (IDRESERVATION)
      REFERENCES RESERVATION (IDRESERVATION) ;


ALTER TABLE AJOUTER 
  ADD FOREIGN KEY FK_AJOUTER_MATERIEL (IDMATERIEL)
      REFERENCES MATERIEL (IDMATERIEL) ;

