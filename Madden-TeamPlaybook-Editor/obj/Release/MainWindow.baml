   M S B A M L   `   `   `  ���� Q  MMadden-Playbook-Editor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null_4clr-namespace:MaddenTeamPlaybookEditor.User_Controls&MaddenTeamPlaybookEditor.User_Controls  Y1clr-namespace:MaddenTeamPlaybookEditor.ViewModels#MaddenTeamPlaybookEditor.ViewModels  ]3clr-namespace:MaddenCustomPlaybookEditor.ViewModels%MaddenCustomPlaybookEditor.ViewModels  C&clr-namespace:MaddenTeamPlaybookEditorMaddenTeamPlaybookEditor  S.clr-namespace:MaddenTeamPlaybookEditor.Classes MaddenTeamPlaybookEditor.Classes  )    #MaddenTeamPlaybookEditor.MainWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     MUserControls4clr-namespace:MaddenTeamPlaybookEditor.User_Controls     TTeamPlaybookViewModels1clr-namespace:MaddenTeamPlaybookEditor.ViewModels     XCustomPlaybookViewModels3clr-namespace:MaddenCustomPlaybookEditor.ViewModels     8local&clr-namespace:MaddenTeamPlaybookEditor     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     Bclasses.clr-namespace:MaddenTeamPlaybookEditor.Classes     -     �Name$  wdwPlaybookEditor�� � Title$! Madden Team Playbook Editor�� � WindowStartupLocation$ CenterScreen=� � Icon$$ /Resources/Playbook_Editor.ico�� � UseLayoutRounding .  � WindowStyle$ ThreeDBorderWindow=�$��Visible=� � WindowState$ 	Maximized=�����  �� ImageSource$ Resources/chalkboard.jpg�� j� Viewport$ 0,0,1920,1067�	 j� ViewportUnits$	 Absolute=�
 j� TileMode$

 Tile=� j� Stretch$ UniformToFill=� j� 
AlignmentX$
 Left=� j� 
AlignmentY$	 Top=� J� CommandBindings )  #System.Windows.Input.CommandBinding  -      Command$ ApplicationCommands.Paste��.��]� $
��Auto��$
��Auto��$��Stretch=�.+�o� $	��Top=� o� 
IsMainMenu . .@�m� $��_File��.@�m� -   $
��Open���� m� -   $��Load Roster���� m� -   $
��Save��m� $��Options��.@�m� $
��Copy�� m� Command$ ApplicationCommands.Copy��m� $��Paste��$ ApplicationCommands.Paste���� m� $��Delete��$  ApplicationCommands.Delete��m� $��	Functions��.@�m� -   $��Set Generic Audibles��m� $��Delete��.@�m� -   $��Remove All Formations��m� -   $��Remove All Sub-Formations��m� -	   $��Remove All Plays��m� -
   $��PSAL Editor��m� $
��Help��.@��� -   $j��dhttps://docs.google.com/spreadsheets/d/1yGtMkVxY1HZ-Pi_ZuffaI1TUtA6tpNpQPQUELa-INaI/edit?usp=sharing?�.�Table Definitions9� 
�������$��Playbook�� 9� ExpandDirection$
 Down=� 9� 
IsExpanded . .��]� $
��Auto��$
��Auto��$��Stretch=�$
��Left=�.+�R� -    R�Name$ tvwPlaybook��$	��Top=� J� 	AllowDrop . $	��600��$��Hidden=�$��Hidden=���Z� ��Z� ��Z� ���� *
Formations+   -   $ ApplicationCommands.Copy��  -   $ ApplicationCommands.Paste��  -   $  ApplicationCommands.Delete�� � 	Resources  �� DataType5   /MaddenTeamPlaybookEditor.ViewModels.FormationVM �� ItemsSource �� ItemContainerStyle �� 
TargetType   SubFormationTreeViewItem �� BasedOn �� Property �� Value �� Mode �� Triggers  �� Binding! �� Value6   0MaddenTeamPlaybookEditor.User_Controls.Formation"  Name#   	formation7   1MaddenCustomPlaybookEditor.ViewModels.FormationVM8   2MaddenTeamPlaybookEditor.ViewModels.SubFormationVM  PlayTreeViewItem9   3MaddenTeamPlaybookEditor.User_Controls.SubFormation$  Name%   showPackage&   subFormation:   4MaddenCustomPlaybookEditor.ViewModels.SubFormationVM0   *MaddenTeamPlaybookEditor.ViewModels.PlayVM1	   +MaddenTeamPlaybookEditor.User_Controls.Play' 	 Name( 	  showAudibles) 	  play2
   ,MaddenCustomPlaybookEditor.ViewModels.PlayVM�� %e  (��       *, +)7   (�� m    *, +)7   (�� �    *, +)7  (�� ;    *, +)7  (�� �    *, +)(�� �    *,
 +)�� "   �� *SubFormations+ �� " Q�8   .���  �@Q�
IsExpanded �� *
IsExpanded+$ TwoWay=���  �@Q�
IsSelected �� *
IsSelected+$ TwoWay=� ��   �� *	IsVisible+! True.a���  � y�$ Visible=���   �� *	IsVisible+	! False.a���  � y�$ 	Collapsed=�.R�  $" uclFormation��{�. # �� �� "   �� *SubFormations+ �� " Q�8   .���  �@Q�
IsExpanded �� *
IsExpanded+$ TwoWay=���  �@Q�
IsSelected �� *
IsSelected+$ TwoWay=� ��   �� *	IsVisible+! True.a���  � y�$ Visible=���   �� *	IsVisible+	! False.a���  � y�$ 	Collapsed=�.R�  $" uclFormation��# �� �� "   �� *Plays+ �� " Q�8   .���  �@Q�
IsExpanded �� *
IsExpanded+$ TwoWay=���  �@Q�
IsSelected �� *
IsSelected+$ TwoWay=� ��   �� *	IsVisible+! True.a���  � y�$ Visible=���   �� *	IsVisible+	! False.a���  � y�$ 	Collapsed=�.R�  $$ uclSubFormation��% . & �� �� "   �� *Plays+ �� " Q�8   .���  �@Q�
IsExpanded �� *
IsExpanded+$ TwoWay=���  �@Q�
IsSelected �� *
IsSelected+$ TwoWay=� ��   �� *	IsVisible+! True.a���  � y�$ Visible=���   �� *	IsVisible+	! False.a���  � y�$ 	Collapsed=�.R�  $$ uclSubFormation��& �� �� "  .R�	  $' uclPlay��( . ) �� �� " 
 .R�	  $' uclPlay��) �� ���� " Q�  FormationTreeViewItem# [ .�-   ��  �@Q�
IsExpanded �� *
IsExpanded+$ TwoWay=���  �@Q�
IsSelected �� *
IsSelected+$ TwoWay=� ��   �� *	IsVisible+! True.a���  � y�$ Visible=���   �� *	IsVisible+	! False.a���  � y�$ 	Collapsed=�9� -   * 9�Name$* xpdSubFormationModal��$y�Visible=�
�������$��Sub Formation��$
 Down=� . .��>   8MaddenTeamPlaybookEditor.User_Controls.SubFormationModal  -   +  Name$+ uclSubFormationModal��$	��Top=�9� -   $* xpdPlayModal��$y�	Collapsed=�
�������$
��Play��$
 Down=� . .��6   0MaddenTeamPlaybookEditor.User_Controls.PlayModal  -   ,  Name$, uclPlayModal��$	��Top=�9� 
�������$��Sabo's Gameplan Editor��$
 Down=� . .��]� $	��Top=�.+�]� .+��� -   - ��Name$- btnRevampGameplan��$��Revamp Gameplan��$	��Top=�$��5q��� -   . ��Name$. cbxPLYT��/ �� SelectedValuePath$	/ Key��0 �� DisplayMemberPath$0 Value��$	��5,1q�
������ $��0q���.  $��Hidden=�$��Hidden=�$	��Top=�1 �� 
IsEditable1 . 2 �� Text$2 Select Plays by Type������ �� -   3 ��Name$3 lvwSituations����.  $��Hidden=�
������ 
������ $	��Top=����� ���� .R�6   0MaddenTeamPlaybookEditor.User_Controls.Situation  4   	situation4 �� ���� .R�>   8MaddenTeamPlaybookEditor.Classes.UniformGridOrientations  $	��Top=�5   Orientation$5 Vertical=�6   VerticalOrientation$	6 Top=�$��LeftToRight=�7 K� IsItemsHost7 . 8 A� Columns$8 1���� -   9 ��Name$9 cvsGameplanPercent��$	��600��$	��600��$
��Left=��� -   $3 iclGameplanPercent��$��Center=���.  $��Hidden=�
������ 
������ $	��Top=����� 5   /MaddenTeamPlaybookEditor.ViewModels.SituationVM"  .R��� : �� Orientation$: 
Horizontal=�$��1q�.+��� $��10��$��10��$��0,0,5,0q�$��Center=����� *
ColorBrush+�� $��14(�
�������$��Center=����� *Title+�� $��14(�
�������$��5,0,0,0q�$��Center=����� *Plays.Count+; �� StringFormat$; ({0})���� $��14(�$��5,0,0,0q�$��Center=����� *
Percentage+���� *
ColorBrush+�� $��%��$��14(�$��Center=����� *
ColorBrush+9� 
�������$��PSALs��$
 Down=� . .��]� $
��Auto��$
��Auto��$��Stretch=�$
��Left=�.+�R� -   $ tvwPSALs��$	��Top=� . $	��600��$��Hidden=�$��Hidden=���Z� ��Z� ��Z� ����  �� %(  (��       *, +)7   (�� f    *, +)7  (�� �    *, +)�� "   �� *SubFormations+ �� " Q�8   .���  �@Q�
IsExpanded �� *
IsExpanded+$ TwoWay=���  �@Q�
IsSelected �� *
IsSelected+$ TwoWay=� ��   �� *	IsVisible+! True.a���  � y�$ Visible=���   �� *	IsVisible+	! False.a���  � y�$ 	Collapsed=�.R�  $" uclFormation��# �� �� "   �� *Plays+ �� " Q�8   .���  �@Q�
IsExpanded �� *
IsExpanded+$ TwoWay=���  �@Q�
IsSelected �� *
IsSelected+$ TwoWay=� ��   �� *	IsVisible+! True.a���  � y�$ Visible=���   �� *	IsVisible+	! False.a���  � y�$ 	Collapsed=�.R�  $$ uclSubFormation��& �� �� "  .R�	  $' uclPlay��) �� ���� " Q�# [ .�-   ��  �@Q�
IsExpanded �� *
IsExpanded+$ TwoWay=���  �@Q�
IsSelected �� *
IsSelected+$ TwoWay=� ��   �� *	IsVisible+! True.a���  � y�$ Visible=���   �� *	IsVisible+	! False.a���  � y�$ 	Collapsed=�9� 
�������$��Tables��$
 Down=�.���� -   < ��Name$< 	tclTables��$	��Top=���Z� ��Z� ��Z� .@��� $
��PBFM��.��6   0MaddenTeamPlaybookEditor.User_Controls.PBFMTable  -   =  Name$= uclPBFMTable��>   PBFM> �� *PBFM+$ TwoWay=��� $
��FORM��.��6   0MaddenTeamPlaybookEditor.User_Controls.FORMTable  -   ?  Name$? uclFORMTable��@   FORM@ �� *FORM+$ TwoWay=��� $
��PBST��.��6   0MaddenTeamPlaybookEditor.User_Controls.PBSTTable  -   A  Name$A uclPBSTTable��B   PBSTB �� *PBST+$ TwoWay=��� $
��SETL��.��6   0MaddenTeamPlaybookEditor.User_Controls.SETLTable  -    C  Name$C uclSETLTable��D   SETLD �� *SETL+$ TwoWay=��� $
��SETP��.��6   0MaddenTeamPlaybookEditor.User_Controls.SETPTable  -!   E  Name$E uclSETPTable��F   SETPF �� *SETP+$ TwoWay=��� $
��SPKF��.��6   0MaddenTeamPlaybookEditor.User_Controls.SPKFTable  -"   G  Name$G uclSPKFTable��H   SPKFH �� *SPKF+$ TwoWay=��� $
��SPKG��.��6   0MaddenTeamPlaybookEditor.User_Controls.SPKGTable  -#   I  Name$I uclSPKGTable��J   SPKGJ �� *SPKG+$ TwoWay=��� $
��SGFM��.��6   0MaddenTeamPlaybookEditor.User_Controls.SGFMTable  -$   K  Name$K uclSGFMTable��L   SGFML �� *SGFM+$ TwoWay=��� $
��SETG��.��6   0MaddenTeamPlaybookEditor.User_Controls.SETGTable  -%   M  Name$M uclSETGTable��N   SETGN �� *SETG+$ TwoWay=��� $
��PBPL��.��6   0MaddenTeamPlaybookEditor.User_Controls.PBPLTable  -&   O  Name$O uclPBPLTable��P   PBPLP �� *PBPL+$ TwoWay=��� $
��PLYL��.��6   0MaddenTeamPlaybookEditor.User_Controls.PLYLTable  -'   Q  Name$Q uclPLYLTable��R   PLYLR �� *PLYL+$ TwoWay=��� $
��PLPD��.��6   0MaddenTeamPlaybookEditor.User_Controls.PLPDTable  -(   S  Name$S uclPLPDTable��T   PLPDT �� *PLPD+$ TwoWay=��� $
��PLRD��.��6   0MaddenTeamPlaybookEditor.User_Controls.PLRDTable  -)   U  Name$U uclPLRDTable��V   PLRDV �� *PLRD+$ TwoWay=��� $
��PLYS��.��6   0MaddenTeamPlaybookEditor.User_Controls.PLYSTable  -*   W  Name$W uclPLYSTable��X   PLYSX �� *PLYS+$ TwoWay=��� $
��PSAL��.��6   0MaddenTeamPlaybookEditor.User_Controls.PSALTable  -+   Y  Name$Y uclPSALTable��Z   PSALZ �� *PSAL+$ TwoWay=��� $
��ARTL��.��6   0MaddenTeamPlaybookEditor.User_Controls.ARTLTable  -,   [  Name$[ uclARTLTable��\   ARTL\ �� *ARTL+$ TwoWay=��� $
��PBAI��.��6    0MaddenTeamPlaybookEditor.User_Controls.PBAITable   --   ]   Name$] uclPBAITable��^    PBAI^ �� *PBAI+$ TwoWay=��� $
��PBAU��.��6!   0MaddenTeamPlaybookEditor.User_Controls.PBAUTable!  -.   _ ! Name$_ uclPBAUTable��` !  PBAU` �� *PBAU+$ TwoWay=��� $
��PBCC��.��6"   0MaddenTeamPlaybookEditor.User_Controls.PBCCTable"  -/   a " Name$a uclPBCCTable��b "  PBCCb �� *PBCC+$ TwoWay=��� $
��PLCM��.��6#   0MaddenTeamPlaybookEditor.User_Controls.PLCMTable#  -0   c # Name$c uclPLCMTable��d #  PLCMd �� *PLCM+$ TwoWay=��� $
��PPCT��.��6$   0MaddenTeamPlaybookEditor.User_Controls.PPCTTable$  -1   e $ Name$e uclPPCTTable��f $  PPCTf �� *PPCT+$ TwoWay=��� $
��SDEF��.��6%   0MaddenTeamPlaybookEditor.User_Controls.SDEFTable%  -2   g % Name$g uclSDEFTable��h %  SDEFh �� *SDEF+$ TwoWay=��� $
��SRFT��.��6&   0MaddenTeamPlaybookEditor.User_Controls.SRFTTable&  -3   i & Name$i uclSRFTTable��j &  SRFTj �� *SRFT+$ TwoWay=�