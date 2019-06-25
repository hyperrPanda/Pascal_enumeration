program UsingEnumerations;
uses TerminalUserInput;


type Genre = (Pop, Classic, Rock);
type
		albumDetails = RECORD  //My custom record
			artistName: String;
			artistGenre: Genre;
			folderLocation: String;
			yearReleased: String;
			rating: String;
		END;

function readGenreFromUser(): albumDetails;        //this funcation will help me to take data from user and create record
var
tmpRecord: albumDetails;
g: Genre;
selection: Integer;
begin
tmpRecord.artistName := ReadString('Enter name of Artist: ');
////////ENUM/////
selection := ReadIntegerRange('Select a genre (1 - 3): ', 1, 3);
// Now you need to tell the compiler that you want to treat this
// integer as a thing of type Genre (not of type integer) so you
// need to 'cast' it to the Genre type:
// Also enumerations start at 0 - we asked above for a number from 1 - 3
// so we need to subtrat 1.
g := Genre(selection -1);
/////ENUM////////
tmpRecord.artistGenre := g;
tmpRecord.folderLocation := ReadString('Enter folder loaction: ');
tmpRecord.yearReleased := ReadString('Enter year released: ');
tmpRecord.rating := ReadString('Enter Rating: ');
result := tmpRecord;
end;

procedure showRecordEntered(myRecord : albumDetails);

begin

if(myRecord.artistName = '') or (myRecord.yearReleased = '') or (myRecord.folderLocation = '') then
WriteLn('Incomplete Album Details')
else
WriteLn('You have entered Artist Name: ',myRecord.artistName,' Genre:',myRecord.artistGenre,' Year released: ',myRecord.yearReleased,
' folder location:',myRecord.folderLocation,' Rating: ',myRecord.rating);
end;

procedure Main();
var
tmpRecord: albumDetails;
begin
tmpRecord := readGenreFromUser();
showRecordEntered(tmpRecord);
end;


begin
	Main();
end.
