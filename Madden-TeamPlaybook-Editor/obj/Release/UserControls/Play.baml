   M S B A M L   `   `   `  ���� Q  MMadden-Playbook-Editor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null_4clr-namespace:MaddenTeamPlaybookEditor.User_Controls&MaddenTeamPlaybookEditor.User_Controls  1    +MaddenTeamPlaybookEditor.User_Controls.Play   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     MUserControls4clr-namespace:MaddenTeamPlaybookEditor.User_Controls     H DMathConverter, Version=2.0.0.0, Culture=neutral, PublicKeyToken=null(mathhttp://hexinnovation.com/math  -     >�Name$  uclPlay�� J� 	AllowDrop .  � 	Resources !  HexInnovation.MathConverter   math  MenuItemPanelTemplate �� 
TargetType �� Property �� Value �� 
TargetType �� CornerRadius J� SnapsToDevicePixels��%�   &	        &	      'm� "     7  '�� A     7    �� .R��� $��	-20,0,0,0q��� " m�.���  � ��8   �� " ��.���  � ��8   ��  � �� �� " ��.R��� $ 10��$��0q�
���/kU� . ._��� .��]� -   	 ]�Name$	 dckPlay��$��Center=�{��� *
IsSelected+
 � ContextMenu
 �� .@��� 
������ 
���������� *PBPL+�� 
������ 
���������� *PLYL+�� 
������ 
���������� *PLPD+�� 
������ 
���������� *PLRD+�� 
������ 
���������� *
Situations+�� 
������ 
���������� *PBCC+�� 
������ 
���������� *PLCM+�� 
������ 
���������� *PPCT+�� 
������ 
���������� *SDEF+�� 
������ 
���������� *SRFT+�� 
������ 
���������� *PLYS+.+��� -    ��Name$ cvsPlay��$	��Top=�$	��180��$	��120��.+��� -    ��Name$ iclPlayarts������ *PlayerPlayartView+ �� Mode$ TwoWay=����� .R��� $ 
cvsPlayers��$	��180��$	��120������ .R�4   .MaddenTeamPlaybookEditor.User_Controls.Playart    Name$ clnARTL��   PSALView .     Scale$ 1Q�   AbsolutePositioning .    Player �� ���� .���  �@��Left �� *	SETP.artx+$ TwoWay=���  �@��Top �� *	SETP.arty+$ TwoWay=��� -   $ iclIcons������ *PlayerPlayartView+$ TwoWay=����� .R��� $ 
cvsPlayers��$	��180��$	��120������ .R�7   1MaddenTeamPlaybookEditor.User_Controls.PlayerIcon    Name$ clnIcon��   Scale$ 1Q�   ShowPosition .    AbsolutePositioning .    Player �� ���� .���  �@��Left �� *	SETP.artx+$ TwoWay=���  �@��Top �� *	SETP.arty+$ TwoWay=��� $��Bottom=� �� Orientation$ Vertical=�$��Center=�.+��� $	��Top=�$��DK Crayon Crumble)�$��15(�$
��Wrap=� �� TextAlignment$ Center=�
������ 
����������� *	PBPL.name+�� -    ��Name$ pnlAudibles��$ 
Horizontal=�$��Center=�$��Bottom=�.+�d� -    d�Name$ AudibleQuick�� � ToolTip$ Short Pass (X)��$��18�� d� 	IsChecked �� *isShortAudible+���� " d�  AudibleQuick �� BasedOn# [ d� -   $ 
AudibleRun��$ Run (Y/Triangle)��$��18�� �� *isRunAudible+���� " d�  
AudibleRun# [ d� -	   $ AudibleDeep��$ Deep Pass (LB/L1)��$��18�� �� *isDeepAudible+���� " d�  AudibleDeep# [ d� -
   $ AudibleFake��$ Play Action (RB/R1)��$��18�� �� *isFakeAudible+���� " d�  AudibleFake# [ 