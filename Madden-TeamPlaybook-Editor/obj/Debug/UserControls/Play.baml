   M S B A M L   `   `   `  ����Q  MMadden-Playbook-Editor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null_4clr-namespace:MaddenTeamPlaybookEditor.User_Controls&MaddenTeamPlaybookEditor.User_Controls  5      1    +MaddenTeamPlaybookEditor.User_Controls.Play   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      MUserControls4clr-namespace:MaddenTeamPlaybookEditor.User_Controls     5      H DMathConverter, Version=2.0.0.0, Culture=neutral, PublicKeyToken=null(mathhttp://hexinnovation.com/math  5      -   5          >�Name$  uclPlay��5       J� 	AllowDrop .  � 	Resources 5      !  HexInnovation.MathConverter   math  MenuItemPanelTemplate �� 
TargetType �� Property �� Value �� 
TargetType �� CornerRadius J� SnapsToDevicePixels��%�  &	        &	      'm� P     7  '�� �     7    5   
   6   �� 5   
   .R�5      �� $��	-20,0,0,0q�6   5      �� 5   
   " m�6   .�5      ��  � ��8   6+   5      �� 5   
   " ��6   .�5      ��  � ��8   6+   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� $ 10��6!   $��0q�63   
���/kU� . ._�5      �� 5      5      5!      5"      5#      .��5%      ]� -   5        	 ]�Name$	 dckPlay��5(   	   $��Center=�5&   	   {�5'   	   �� *
IsSelected+
 � ContextMenu
 5*   
   �� 5+      .@�5,      �� 
������ 
��������5/      �� *PBPL+�� 51      
������ 
��������54      �� *PLYL+�� 56      
������ 
��������59      �� *PLPD+�� 5;      
������ 
��������5>      �� *PLRD+�� 5@      
������ 
��������5C      �� *
Situations+�� 5E      
������ 
��������5H      �� *PBCC+�� 5J      
������ 
��������5M      �� *PLCM+�� 5O      
������ 
��������5R      �� *PPCT+�� 5T      
������ 
��������5W      �� *SDEF+�� 5Y      
������ 
��������5\      �� *SRFT+�� 5^      
������ 
��������5a      �� *PLYS+5c      .+�5f   
   �� -   5         ��Name$ cvsPlay��5f      $	��Top=�5g      $	��180��5h      $	��120��5i      .+�5l      �� -   5         ��Name$ iclPlayarts��5m      ��5n      �� *PlayerPlayartView+ �� Mode$ TwoWay=���5o      �� 5p      .R�5q      �� $ 
cvsPlayers��5r      $	��180��5s      $	��120��5t      5v      ��5x      �� 5y      .R�5z      4   .MaddenTeamPlaybookEditor.User_Controls.Playart    Name$ clnARTL��5{         PSALView .     Scale$ 1Q�5~         AbsolutePositioning .    Player 5|      �� 5�      5�      ��5�      �� 5�      .�5�      ��  �@��Left 5�      �� *	SETP.artx+$ TwoWay=��� 5�       �@��Top 5�      �� *	SETP.arty+$ TwoWay=�5�      5�      �� 5�      -   5        $ iclIcons��5�      ��5�      �� *PlayerPlayartView+$ TwoWay=���5�      �� 5�      .R�5�      �� $ 
cvsPlayers��5�      $	��180��5�      $	��120��5�      5�      ��5�      �� 5�      .R�5�      7   1MaddenTeamPlaybookEditor.User_Controls.PlayerIcon    Name$ clnIcon��5�         Scale$ 1Q�5�         ShowPosition .    AbsolutePositioning .    Player 5�      �� 5�      5�      ��5�      �� 5�      .�5�      ��  �@��Left 5�      �� *	SETP.artx+$ TwoWay=��� 5�       �@��Top 5�      �� *	SETP.arty+$ TwoWay=�5�      5�      5�      �� 5�   
   $��Bottom=�5�       �� Orientation$ Vertical=�5�      $��Center=�5�      .+�5�      �� $	��Top=�5�      $��DK Crayon Crumble)�5�      $��15(�5�      $
��Wrap=�5�       �� TextAlignment$ Center=�5�      
������ 
���������5�      �� *	PBPL.name+5�      �� 5�      -   5         ��Name$ pnlAudibles��5�   j   $ 
Horizontal=�6   $��Center=�62   $��Bottom=�6O   .+�5�      d� -   5         d�Name$ AudibleQuick��5�       � ToolTip$ Short Pass (X)��65   $��18��6N    d� 	IsChecked 6Z   �� *isShortAudible+��5�      �� 5�      " d�6      AudibleQuick �� BasedOn# [ 6C   5�      d� 5�      -   5        $ 
AudibleRun��5�      $ Run (Y/Triangle)��63   $��18��6N    6Z   �� *isRunAudible+��5�      �� 5�      " d�6      
AudibleRun# [ 6C   5�      d� 5�      -	   5        $ AudibleDeep��5�      $ Deep Pass (LB/L1)��64   $��18��6P    6\   �� *isDeepAudible+��5�      �� 5�      " d�6      AudibleDeep# [ 6C   5�      d� 5�      -
   5        $ AudibleFake��5�      $ Play Action (RB/R1)��64   $��18��6R    6^   �� *isFakeAudible+��5�      �� 5�      " d�6      AudibleFake# [ 6C   5�      5�      5�      5�      5�      