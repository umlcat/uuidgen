unit ufrmmainstrs;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  dummy;

resourcestring
  resMainForm_Caption      = 'UUID To Text Generator';

  resUUIDToTextTabSheet_Caption = 'UUID To Text';
  resTextToUUIDTabSheet_Caption = 'Text To UUID';

  resExecuteButton_Caption = 'Generate';
  resExitButton_Caption    = 'Exit';

  resSingleUUIDStrButton_Caption   = 'Copy';
  resDoubleUUIDStrButton_Caption   = 'Copy';
  resLongUUIDStrButton_Caption     = 'Copy';
  resPascalByteArrayButton_Caption = 'Copy';
  resPlainCByteArrayButton_Caption = 'Copy';

  resSingleUUIDStrLabel_Caption   = 'Single String:';
  resDoubleUUIDStrLabel_Caption   = 'Double String:';
  resLongUUIDStrLabel_Caption     = 'Long String:';
  resPascalByteArrayLabel_Caption = 'Pascal Byte Array:';
  resPlainCByteArrayLabel_Caption = 'Plain C Byte Array:';

  resSourceSingleUUIDStrRadioButton_Caption   = 'Single String:';
  resDoubleUUIDStrSourceRadioButton_Caption   = 'Double String:';
  resLongUUIDStrSourceRadioButton_Caption     = 'Long String:';
  resPascalByteArraySourceRadioButton_Caption = 'Pascal Byte Array:';
  resPlainCByteArraySourceRadioButton_Caption = 'Plain C Byte Array:';
  resResultLabel_Caption                      = 'Result:';

  resSingleUUIDStrPasteButton_Caption   = 'Paste';
  resDoubleUUIDStrPasteButton_Caption   = 'Paste';
  resLongUUIDStrPasteButton_Caption     = 'Paste';
  resPascalByteArrayPasteButton_Caption = 'Paste';
  resPlainCByteArrayPasteButton_Caption = 'Paste';


implementation

end.

