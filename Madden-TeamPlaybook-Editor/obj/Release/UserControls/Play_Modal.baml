   M S B A M L   `   `   `  ���� Q  MMadden-Playbook-Editor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null_4clr-namespace:MaddenTeamPlaybookEditor.User_Controls&MaddenTeamPlaybookEditor.User_Controls  S.clr-namespace:MaddenTeamPlaybookEditor.Classes MaddenTeamPlaybookEditor.Classes  6    0MaddenTeamPlaybookEditor.User_Controls.PlayModal   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     MUserControls4clr-namespace:MaddenTeamPlaybookEditor.User_Controls     Bclasses.clr-namespace:MaddenTeamPlaybookEditor.Classes     -     >�Name$  uclPlayModal�� J� 	AllowDrop .  � 	Resources    MenuItemPanelTemplate �� 
TargetType �� Property �� Value �� 
TargetType �� CornerRadius J� SnapsToDevicePixels&   System.Windows.Controls.DataGrid=  7System.Windows.Controls.Primitives.DataGridColumnHeader:  4System.Windows.Controls.Primitives.DataGridRowHeader  
FieldBrush	 �� ImageSource
 �� BitmapScalingMode j� Stretch j� 
AlignmentY��%�  &	        'm�      7   '�� <     7   '  �     '�� �    '�� M    '  �    '  	    &	 B    �� .R��� $��	-20,0,0,0q��� " m�.���  � ��8   �� " ��.���  � ��8   ��  � �� �� " ��.R��� $ 10��$��0q�
���/kU� . ._��� �� "  .���  � ��
 ���� ��  � ��
 ������  �@ RowBackground
 ���� ��  � ��
 ������  �@ GridLinesVisibility$	 All=���   �@ HorizontalGridLinesBrush
 ������  �@ VerticalGridLinesBrush
 ������  �@ CanUserAddRows . ��  �@ CanUserDeleteRows . �� " ��.���  � ��
 ���� ��  � ��
 ������  � ��$
 Bold"��� " ��.���  � ��
 ���� ��  � ��
 ������  � ��
 ������ "  .���  � ��
 ���� ��  � ��$
 Bold"���  � ��$ 30����  � {� .  �� "  .���  � ��
 ���� ��  � {� .  �� $!	 ../Resources/full_field.jpg��$

 Fant=�$ UniformToFill=�$	 Top=�.���� -    ��Name$ cvsField��$	��950��$	��533��.+��� -   $��bdrField��#��[ $ 10��$	��533��$	��950���� 	 �� X1$ 0��	 �� Y1$ 599.5��	 �� X2$	 533��	 �� Y2$ 599.5��$��5������  �� Color ��  �� A$ 96�� �� R$ 0�� �� G$ 0�� �� B$ 0���� $ 0��$ 499.5��$	 533��$ 499.5��$��5������  �� $ 80��$	 160��$	 160��$ 0���� -    ��Name$ iclPSALs��{�. $	��Top=� �� Left$ 266.5��
 �� Top$	 600������ *PlayerPlayartView+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=����� .R��� $ cvsPlayerRoutes������ .R��� .+�4   .MaddenTeamPlaybookEditor.User_Controls.Playart    Name$ clnPSAL��   PSALView .    Scale$ 2Q�   AbsolutePositioning .     Player  �� ���� .���  �@��Left �� *XY.X+$ TwoWay=���  �@��Top �� *XY.Y+$ TwoWay=�! �� Triggers! P� " P� Property" �@J�IsMouseOver# P� Value# . . ���  �@J�Effect 3  -System.Windows.Media.Effects.DropShadowEffect  $   ShadowDepth$$ 0Q�%   Color$% White��&   Opacity$& 1Q�'   
BlurRadius$' 20Q��� -   $ iclIcons��{�. $	��Top=�$ 266.5��$	 600������ *PlayerPlayartView+$ TwoWay=�$ PropertyChanged=����� .R��� $ cvsPlayerIcons������ .R��� .+�7   1MaddenTeamPlaybookEditor.User_Controls.PlayerIcon  (  Name$( clnIcon��)   Scale$) 2Q�*   ShowPosition* . +   AbsolutePositioning+ . ,   Player, �� ���� .���  �@��Left �� *XY.X+��  �@��Top �� *XY.Y+! P� " �@J�IsMouseOver# . . ���  �@J�Effect   $$ 0Q�$% White��$& 1Q�$' 20Q���  � z� �� - �� ScaleX$- 2Q�. �� ScaleY$. 2Q�]� -   / ]�Name$/ ReferenceInfo��$��0,0,0,0q�$ 0��$ 0��$	��800��$	��533����.  .+��� -   0 ��Name$0 tabPlayControls��
������ 
������ $	��Top=�$��Bottom=�$��Stretch=� 1 ��Name2 �� Triggers3 �� 
TargetName��%k  '��       �� " ��.���  � �� �� " ��.R��� $��Panel��.���� $1 ContentSite��$	��Top=�$��Center=�$��Header��$��102.15,2q�2 P� " �@��
IsSelected# . . ��� $3 Panel�� � ��
 ���� �� $3 Panel�� � ��
 ����P� " �@��
IsSelected# .  . ��� $3 Panel�� � ��
 ���� �� $3 Panel�� � ��
 �   �.@��� $��	Edit Play��.���� -   $0 tabPlay��
������ 
������ $��Bottom=�$��Bottom=�$��Stretch=� ��%l  '��       �� " ��.���  � �� �� " ��.R��� $��Panel��.���� $1 ContentSite��$��Center=�$��Center=�$��Header��$��14.1,2q�2 P� " �@��
IsSelected# . . ��� $3 Panel�� � ��
 ���� �� $3 Panel�� � ��
 ����P� " �@��
IsSelected# .  . ��� $3 Panel�� � ��
 ���� �� $3 Panel�� � ��
 �   �.@��� $
��PBPL��.��� $��Center=�4 � ColumnDefinitions4 �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto �5 � RowDefinitions5 �� �� .+��� $	��5,0q�
������$��0��$��0��$	��rec���� {�.  $��0��$��1������ *
PBPL.rec+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��1��$��0��$
��PKGE���� $��1��$��1������ *	PBPL.PKGE+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��2��$��0��$
��COMF���� $��2��$��1������ *	PBPL.COMF+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��3��$��0��$
��pbpl���� $��3��$��1������ *	PBPL.pbpl+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��4��$��0��$
��PLYL���� $��4��$��1������ *	PBPL.PLYL+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��5��$��0��$
��PBST���� $��5��$��1������ *	PBPL.PBST+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��6��$��0��$
��ord_���� {�.  $��6��$��1������ *	PBPL.ord_+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��7��$��0��$
��name���� $��7��$��1������ *	PBPL.name+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��8��$��0��$
��Flag���� $��8��$��1������ *	PBPL.Flag+$ TwoWay=�$ PropertyChanged=��� $
��PLYL��.��� $��Center=�4 �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto �5 �� �� .+��� $	��5,0q�
������$��0��$��0��$	��rec���� {�.  $��0��$��1������ *
PLYL.rec+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��1��$��0��$
��SETL���� $��1��$��1������ *	PLYL.SETL+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��2��$��0��$
��plyl���� $��2��$��1������ *	PLYL.plyl+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��3��$��0��$
��SRMM���� $��3��$��1������ *	PLYL.SRMM+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��4��$��0��$
��SITT���� $��4��$��1������ *	PLYL.SITT+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��5��$��0��$
��PLYT���� $��5��$��1������ *	PLYL.PLYT+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��6��$��0��$
��PLF_���� $��6��$��1������ *	PLYL.PLF_+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��7��$��0��$
��name���� $��7��$��1������ *	PLYL.name+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��8��$��0��$
��risk���� $��8��$��1������ *	PLYL.risk+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��9��$��0��$
��motn���� $��9��$��1������ *	PLYL.motn+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��10��$��0��$
��phlp���� $��10��$��1������ *	PLYL.phlp+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��11��$��0��$
��vpos���� $��11��$��1������ *	PLYL.vpos+$ TwoWay=�$ PropertyChanged=��� $
��PLPD��.��]� .+�� $	��Top=�$��Center=�4 �� $
��Auto ��� $
��Auto �5 �� �� .+��� $	��5,0q�
������$��0��$��0��$	��rec���� {�.  $��0��$��1������ *
PLPD.rec+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��1��$��0��$
��PLYL���� $��1��$��1������ *	PLPD.PLYL+$ TwoWay=�$ PropertyChanged=�  $	��Top=�$��Center=����� *PLPD.progressions+$ TwoWay=�$ PropertyChanged=��� $
��PLRD��.��� $��0��$��0��$
��Left=�$��Center=�4 �� $
��Auto ��� $
��Auto ��� $
��Auto �5 �� �� .+��� $	��5,0q�
������$��0��$��0��$	��rec���� {�.  $��0��$��1������ *
PLRD.rec+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��1��$��0��$
��PLYL���� $��1��$��1������ *	PLRD.PLYL+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��2��$��0��$
��hole���� $��2��$��1������ *	PLRD.hole+$ TwoWay=�$ PropertyChanged=��� $
��PBCC��.��  $��Bottom=�$��Bottom=�$��Center=����� *PBCC+$ TwoWay=�$ PropertyChanged=��� $
��PLCM��.��  $��Bottom=�$��Bottom=�$��Center=����� *PLCM+$ TwoWay=�$ PropertyChanged=��� $
��PPCT��.��  $��Bottom=�$��Bottom=�$��Center=����� *PPCT+$ TwoWay=�$ PropertyChanged=��� $
��SRFT��.��  $��Bottom=�$��Bottom=�$��Center=����� *SRFT+$ TwoWay=�$ PropertyChanged=��� $��Edit Player��.���� -	   $0 	tabPlayer��
������ 
������ $	��Top=�$��Bottom=�$��Stretch=� ��%j  '��       �� " ��.���  � �� �� " ��.R��� $��Panel��.���� $1 ContentSite��$	��Top=�$��Center=�$��Header��$��69.1, 2q�2 P� " �@��
IsSelected# . . ��� $3 Panel�� � ��
 ���� �� $3 Panel�� � ��
 ����P� " �@��
IsSelected# .  . ��� $3 Panel�� � ��
 ���� �� $3 Panel�� � ��
 �   �.@��� $
��SETP��.��� $��Center=�4 �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto �5 �� �� .+��� $	��5,0q�
������$��0��$��0��$	��rec���� -
   {�.  $��0��$��1������ *
SETP.rec+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��1��$��0��$
��SETL���� -   $��1��$��1������ *	SETP.SETL+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��2��$��0��$
��setp���� -   $��2��$��1������ *	SETP.setp+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��3��$��0��$
��SGT_���� -   $��3��$��1������ *	SETP.SGT_+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��4��$��0��$
��arti���� -   $��4��$��1������ *	SETP.arti+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��5��$��0��$
��tabo���� -   $��5��$��1������ *	SETP.tabo+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��6��$��0��$
��poso���� -   $��6��$��1������ *	SETP.poso+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��7��$��0��$
��flas���� -   $��7��$��1������ *	SETP.flas+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��8��$��0��$
��DPos���� -   $��8��$��1������ *	SETP.DPos+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��9��$��0��$
��EPos���� -   $��9��$��1������ *	SETP.EPos+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��10��$��0��$
��fmtx���� -   $��10��$��1������ *	SETP.fmtx+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��11��$��0��$
��artx���� -   $��11��$��1������ *	SETP.artx+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��12��$��0��$
��fmty���� -   $��12��$��1������ *	SETP.fmty+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��13��$��0��$
��arty���� -   $��13��$��1������ *	SETP.arty+$ TwoWay=�$ PropertyChanged=��� $
��SETG��.��� $��Center=�4 �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto �5 �� �� .+��� $	��5,0q�
������$��0��$��0��$	��rec���� -   {�.  $��0��$��1������ *
SETG.rec+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��1��$��0��$
��setg���� -   $��1��$��1������ *	SETG.setg+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��2��$��0��$
��SETP���� -   $��2��$��1������ *	SETG.SETP+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��3��$��0��$
��SGF_���� -   $��3��$��1������ *	SETG.SGF_+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��4��$��0��$
��SF__���� -   $��4��$��1������ *	SETG.SF__+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��5��$��0��$
��x___���� -   $��5��$��1������ *	SETG.x___+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��6��$��0��$
��y___���� -   $��6��$��1������ *	SETG.y___+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��7��$��0��$
��fx__���� -   $��7��$��1������ *	SETG.fx__+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��8��$��0��$
��fy__���� -    $��8��$��1������ *	SETG.fy__+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��9��$��0��$
��anm_���� -!   $��9��$��1������ *	SETG.anm_+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��10��$��0��$
��dir_���� -"   $��10��$��1������ *	SETG.dir_+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��11��$��0��$
��fanm���� -#   $��11��$��1������ *	SETG.fanm+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��12��$��0��$
��fdir���� -$   $��12��$��1������ *	SETG.fdir+$ TwoWay=�$ PropertyChanged=��� $
��SRFT��.��� $��Center=�4 �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto �5 �� �� .+��� $	��5,0q�
������$��0��$��0��$	��rec���� -%   {�.  $��0��$��1������ *
SRFT.rec+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��1��$��0��$
��SIDE���� -&   $��1��$��1������ *	SRFT.SIDE+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��2��$��0��$
��YOFF���� -'   $��2��$��1������ *	SRFT.YOFF+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��3��$��0��$
��TECH���� -(   $��3��$��1������ *	SRFT.TECH+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��4��$��0��$
��PLYL���� -)   $��4��$��1������ *	SRFT.PLYL+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��5��$��0��$
��STAN���� -*   $��5��$��1������ *	SRFT.STAN+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��6��$��0��$
��PLYR���� -+   $��6��$��1������ *	SRFT.PLYR+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��7��$��0��$
��PRIS���� -,   $��7��$��1������ *	SRFT.PRIS+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��8��$��0��$
��GAPS���� --   $��8��$��1������ *	SRFT.GAPS+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��9��$��0��$
��ASSS���� -.   $��9��$��1������ *	SRFT.ASSS+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��10��$��0��$
��PRIW���� -/   $��10��$��1������ *	SRFT.PRIW+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��11��$��0��$
��GAPW���� -0   $��11��$��1������ *	SRFT.GAPW+$ TwoWay=�$ PropertyChanged=��� $	��5,0q�
������$��12��$��0��$
��ASSW���� -1   $��12��$��1������ *	SRFT.ASSW+$ TwoWay=�$ PropertyChanged=�