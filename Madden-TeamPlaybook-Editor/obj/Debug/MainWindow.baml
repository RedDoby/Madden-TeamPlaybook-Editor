   M S B A M L   `   `   `  ����Q  MMadden-Playbook-Editor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null_4clr-namespace:MaddenTeamPlaybookEditor.User_Controls&MaddenTeamPlaybookEditor.User_Controls  5      Y1clr-namespace:MaddenTeamPlaybookEditor.ViewModels#MaddenTeamPlaybookEditor.ViewModels  5      ]3clr-namespace:MaddenCustomPlaybookEditor.ViewModels%MaddenCustomPlaybookEditor.ViewModels  5      C&clr-namespace:MaddenTeamPlaybookEditorMaddenTeamPlaybookEditor  5      S.clr-namespace:MaddenTeamPlaybookEditor.Classes MaddenTeamPlaybookEditor.Classes  5
      )    #MaddenTeamPlaybookEditor.MainWindow   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      MUserControls4clr-namespace:MaddenTeamPlaybookEditor.User_Controls     5      TTeamPlaybookViewModels1clr-namespace:MaddenTeamPlaybookEditor.ViewModels     5      XCustomPlaybookViewModels3clr-namespace:MaddenCustomPlaybookEditor.ViewModels     5      8local&clr-namespace:MaddenTeamPlaybookEditor     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5	      Bclasses.clr-namespace:MaddenTeamPlaybookEditor.Classes     5
      -   5          �Name$  wdwPlaybookEditor��5       � Title$! Madden Team Playbook Editor��5       � WindowStartupLocation$ CenterScreen=�5       � Icon$$ /Resources/Playbook_Editor.ico��5       � UseLayoutRounding .  � WindowStyle$ ThreeDBorderWindow=�5      $��Visible=�5       � WindowState$ 	Maximized=�5      ��5      �� 5   
    �� ImageSource$ Resources/chalkboard.jpg��5       j� Viewport$ 0,0,1920,1067�5      	 j� ViewportUnits$	 Absolute=�5      
 j� TileMode$

 Tile=�5       j� Stretch$ UniformToFill=�5       j� 
AlignmentX$
 Left=�5       j� 
AlignmentY$	 Top=�5       J� CommandBindings 5#      )  #System.Windows.Input.CommandBinding  5$   
   -   5           Command$ ApplicationCommands.Paste��5$      6=   .��5'      ]� $
��Auto��6   $
��Auto��6   $��Stretch=�6+   .+�5)   
   o� $	��Top=�6    o� 
IsMainMenu . .@�5*      m� $��_File��6   .@�5+      m� -   5        $
��Open��5+      6)   �� 5,      m� 5-      -   5        $��Load Roster��5-      60   �� 5.      m� 5/      -   5        $
��Save��5/      6)   50      m� 51      $��Options��6   .@�52      m� $
��Copy��6    m� Command$ ApplicationCommands.Copy��6)   m� 53      $��Paste��6   $ ApplicationCommands.Paste��6*   �� 54      m� 55      $��Delete��6   $  ApplicationCommands.Delete��6+   56      m� 57      $��	Functions��6   .@�58      m� -   5        $��Set Generic Audibles��58      69   m� 59      $��Delete��6   .@�5:      m� -   5        $��Remove All Formations��5:      6>   m� 5;      -   5        $��Remove All Sub-Formations��5;      6B   m� 5<      -	   5        $��Remove All Plays��5<      69   5=      m� 5A      -
   5        $��PSAL Editor��5A      60   5B      m� 5C      $
��Help��6   .@�5D      �� -   5        $j��dhttps://docs.google.com/spreadsheets/d/1yGtMkVxY1HZ-Pi_ZuffaI1TUtA6tpNpQPQUELa-INaI/edit?usp=sharing?�5D      .�6�   Table Definitions5F      5G      5H      9� 5J   
   
�������$��Playbook��6*    9� ExpandDirection$
 Down=�6<    9� 
IsExpanded . .��5L      ]� $
��Auto��6   $
��Auto��6%   $��Stretch=�63   $
��Left=�6Q   .+�5N      R� -   5         R�Name$ tvwPlaybook��5N      $	��Top=�5R       J� 	AllowDrop . $	��600��5X      $��Hidden=�5Y      $��Hidden=�5Z      ��5O      Z� ��5P      Z� ��5Q      Z� ��5W      �� *
Formations+ 5\        5]      -   5        $ ApplicationCommands.Copy��5]   %   6H     5^      -   5        $ ApplicationCommands.Paste��5^   %   6I     5_      -   5        $  ApplicationCommands.Delete��5_   %   6J    � 	Resources 5b       �� DataType5   /MaddenTeamPlaybookEditor.ViewModels.FormationVM �� ItemsSource �� ItemContainerStyle �� 
TargetType   SubFormationTreeViewItem �� BasedOn �� Property �� Value �� Mode �� Triggers  �� Binding! �� Value6   0MaddenTeamPlaybookEditor.User_Controls.Formation"  Name#   	formation7   1MaddenCustomPlaybookEditor.ViewModels.FormationVM8   2MaddenTeamPlaybookEditor.ViewModels.SubFormationVM  PlayTreeViewItem9   3MaddenTeamPlaybookEditor.User_Controls.SubFormation$  Name%   showPackage&   subFormation:   4MaddenCustomPlaybookEditor.ViewModels.SubFormationVM0   *MaddenTeamPlaybookEditor.ViewModels.PlayVM1	   +MaddenTeamPlaybookEditor.User_Controls.Play' 	 Name( 	  showAudibles) 	  play2
   ,MaddenCustomPlaybookEditor.ViewModels.PlayVM�� 5d      %
  (��       5f   3   *, +)7   (�� :    5{   3   *, +)7   (�� h    5�   3   *, +)7  (�� �    5�   3   *, +)7  (�� �    5�   3   *, +)(�� %	    5�   3   *,
 +)�� 5f      "  63    6j   �� *SubFormations+ 5h      �� 5i   "   " Q�6(   8   .�5j   &   ��  �@Q�
IsExpanded 6C   �� *
IsExpanded+$ TwoWay=��� 5k   &    �@Q�
IsSelected 6C   �� *
IsSelected+$ TwoWay=� 5l   &   �� 5m   *     66   �� *	IsVisible+! True6T   .a�5n   .   ��  � y�$ Visible=�6K   5o   +   �� 5p   *     66   �� *	IsVisible+	! False6T   .a�5q   .   ��  � y�$ 	Collapsed=�6K   5r   +   5t   #   .R�5w   "     $" uclFormation��69   {�. # 6O   �� 6e   5y      �� 5{      "  63    6l   �� *SubFormations+ 5}      �� 5~   "   " Q�6(   8   .�5   &   ��  �@Q�
IsExpanded 6C   �� *
IsExpanded+$ TwoWay=��� 5�   &    �@Q�
IsSelected 6C   �� *
IsSelected+$ TwoWay=� 5�   &   �� 5�   *     66   �� *	IsVisible+! True6T   .a�5�   .   ��  � y�$ Visible=�6K   5�   +   �� 5�   *     66   �� *	IsVisible+	! False6T   .a�5�   .   ��  � y�$ 	Collapsed=�6K   5�   +   5�   #   .R�5�        $" uclFormation��65   # 6K   �� 5�      �� 5�      "  63    6m   �� *Plays+ 5�      �� 5�   "   " Q�6(   8   .�5�   &   ��  �@Q�
IsExpanded 6C   �� *
IsExpanded+$ TwoWay=��� 5�   &    �@Q�
IsSelected 6C   �� *
IsSelected+$ TwoWay=� 5�   &   �� 5�   *     66   �� *	IsVisible+! True6T   .a�5�   .   ��  � y�$ Visible=�6K   5�   +   �� 5�   *     66   �� *	IsVisible+	! False6T   .a�5�   .   ��  � y�$ 	Collapsed=�6K   5�   +   5�   #   .R�5�   "     $$ uclSubFormation��6<   % . & 6U   �� 6n   5�      �� 5�      "  63    6o   �� *Plays+ 5�      �� 5�   "   " Q�6(   8   .�5�   &   ��  �@Q�
IsExpanded 6C   �� *
IsExpanded+$ TwoWay=��� 5�   &    �@Q�
IsSelected 6C   �� *
IsSelected+$ TwoWay=� 5�   &   �� 5�   *     66   �� *	IsVisible+! True6T   .a�5�   .   ��  � y�$ Visible=�6K   5�   +   �� 5�   *     66   �� *	IsVisible+	! False6T   .a�5�   .   ��  � y�$ 	Collapsed=�6K   5�   +   5�   #   .R�5�        $$ uclSubFormation��68   & 6Q   �� 5�      �� 5�      "  63   .R�5�      	  $' uclPlay��60   ( . ) 6A   �� 6R   5�      �� 5�      " 
 63   .R�5�      	  $' uclPlay��60   ) 6A   �� 5�      5�      ��5�      �� 5�      " Q�6     FormationTreeViewItem# [ 6?   .�5�      -   5        �� 5�       �@Q�
IsExpanded 67   �� *
IsExpanded+$ TwoWay=��� 5�       �@Q�
IsSelected 67   �� *
IsSelected+$ TwoWay=� 5�      �� 5�        6*   �� *	IsVisible+! True6H   .a�5�   "   ��  � y�$ Visible=�6?   5�      �� 5�        6*   �� *	IsVisible+	! False6H   .a�5�   "   ��  � y�$ 	Collapsed=�6?   5�      5�      5�      5�      5�      9� 5�   
   -   5        * 9�Name$* xpdSubFormationModal��5�      $y�Visible=�61   
�������$��Sub Formation��6]   $
 Down=�6t    . .��5�      >   8MaddenTeamPlaybookEditor.User_Controls.SubFormationModal  -   5        +  Name$+ uclSubFormationModal��5�   -   $	��Top=�6K   5�      9� 5�   
   -   5        $* xpdPlayModal��5�      $y�	Collapsed=�6)   
�������$
��Play��6W   $
 Down=�6e    . .��5�      6   0MaddenTeamPlaybookEditor.User_Controls.PlayModal  -   5        ,  Name$, uclPlayModal��5�   %   $	��Top=�6;   5�      9� 5  
   
�������$��Sabo's Gameplan Editor��6*   $
 Down=�6J    . .��5     ]� $	��Top=�6   .+�5!     ]� .+�5#     �� -   5        - ��Name$- btnRevampGameplan��5#     $��Revamp Gameplan��68   $	��Top=�6R   $��5q�6g   6r   �� 5%     -   5        . ��Name$. cbxPLYT��5&     / �� SelectedValuePath$	/ Key��5(     0 �� DisplayMemberPath$0 Value��5)     $	��5,1q�5*     
������ $��0q�5,     ��.  $��Hidden=�5/     $��Hidden=�50     $	��Top=�51     1 �� 
IsEditable1 . 2 �� Text$2 Select Plays by Type��53     ��5'     �� 53     �� 55     -   5        3 ��Name$3 lvwSituations��56     ��.  $��Hidden=�59     
������ 
������ $	��Top=�5>     ��57     �� ��5?     �� 5@     .R�5A  "   6   0MaddenTeamPlaybookEditor.User_Controls.Situation  4   	situation4 69   �� 5B     ��5D     �� 5E     .R�5F  "   >   8MaddenTeamPlaybookEditor.Classes.UniformGridOrientations  $	��Top=�6B   5   Orientation$5 Vertical=�6Z   6   VerticalOrientation$	6 Top=�6q   $��LeftToRight=�6�   7 K� IsItemsHost7 . 8 A� Columns$8 1��6�   5G     5I     5K     �� 5M     -   5        9 ��Name$9 cvsGameplanPercent��5M     $	��600��65   $	��600��6B   $
��Left=�6N   �� 5O     -   5        $3 iclGameplanPercent��5P     $��Center=�5Q     ��.  $��Hidden=�5S     
������ 
������ $	��Top=�5W     ��5X     �� 5Y     5   /MaddenTeamPlaybookEditor.ViewModels.SituationVM"  6'   .R�5Z     �� : �� Orientation$: 
Horizontal=�6)   $��1q�6B   .+�5[  "   �� $��10��5\  %   $��10��5]  %   $��0,0,5,0q�5_  %   $��Center=�5`  %   ��5^  %   �� *
ColorBrush+5`  %   �� 5b  "   $��14(�5c  %   
�������$��Center=�5e  %   ��5b  ,   �� *Title+5e  %   �� 5g  "   $��14(�5h  %   
�������$��5,0,0,0q�5j  %   $��Center=�5k  %   ��5g  ,   �� *Plays.Count+; �� StringFormat$; ({0})��5k  %   �� 5m  "   $��14(�5o  %   $��5,0,0,0q�5p  %   $��Center=�5q  %   ��5m  ,   �� *
Percentage+��5n  %   �� *
ColorBrush+5q  %   �� 5s  "   $��%��6,   $��14(�5u  %   $��Center=�5v  %   ��5t  %   �� *
ColorBrush+5v  %   5w     5x     5z     5|     5~     9� 5�  
   
�������$��PSALs��6*   $
 Down=�69    . .��5�     ]� $
��Auto��6   $
��Auto��6%   $��Stretch=�63   $
��Left=�6Q   .+�5�     R� -   5        $ tvwPSALs��5�     $	��Top=�5�      . $	��600��5�     $��Hidden=�5�     $��Hidden=�5�     ��5�     Z� ��5�     Z� ��5�     Z� ��5�     ��  5�     �� 5�     %�  (��       5�  7   *, +)7   (�� .    5�  7   *, +)7  (�� W    5�  7   *, +)�� 5�     "  67    6n   �� *SubFormations+ 5�  "   �� 5�  &   " Q�6,   8   .�5�  *   ��  �@Q�
IsExpanded 6G   �� *
IsExpanded+$ TwoWay=��� 5�  *    �@Q�
IsSelected 6G   �� *
IsSelected+$ TwoWay=� 5�  *   �� 5�  .     6:   �� *	IsVisible+! True6X   .a�5�  2   ��  � y�$ Visible=�6O   5�  /   �� 5�  .     6:   �� *	IsVisible+	! False6X   .a�5�  2   ��  � y�$ 	Collapsed=�6O   5�  /   5�  '   .R�5�  "     $" uclFormation��69   # 6O   �� 5�     �� 5�     "  67    6q   �� *Plays+ 5�  "   �� 5�  &   " Q�6,   8   .�5�  *   ��  �@Q�
IsExpanded 6G   �� *
IsExpanded+$ TwoWay=��� 5�  *    �@Q�
IsSelected 6G   �� *
IsSelected+$ TwoWay=� 5�  *   �� 5�  .     6:   �� *	IsVisible+! True6X   .a�5�  2   ��  � y�$ Visible=�6O   5�  /   �� 5�  .     6:   �� *	IsVisible+	! False6X   .a�5�  2   ��  � y�$ 	Collapsed=�6O   5�  /   5�  '   .R�5�  "     $$ uclSubFormation��6<   & 6U   �� 5�     �� 5�     "  67   .R�5�  "   	  $' uclPlay��64   ) 6E   �� 5�     5�     ��5�     �� 5�     " Q�6    # [ 6C   .�5�     -   5        �� 5�      �@Q�
IsExpanded 6;   �� *
IsExpanded+$ TwoWay=��� 5�      �@Q�
IsSelected 6;   �� *
IsSelected+$ TwoWay=� 5�     �� 5�  "     6.   �� *	IsVisible+! True6L   .a�5�  &   ��  � y�$ Visible=�6C   5�  #   �� 5�  "     6.   �� *	IsVisible+	! False6L   .a�5�  &   ��  � y�$ 	Collapsed=�6C   5�  #   5�     5�     5�     5�     9� 5�  
   
�������$��Tables��6*   $
 Down=�6:   .��5�     �� -   5        < ��Name$< 	tclTables��5�     $	��Top=�5�     ��5�     Z� ��5�     Z� ��5�     Z� .@�5�     �� $
��PBFM��6   .��5�     6   0MaddenTeamPlaybookEditor.User_Controls.PBFMTable  -   5        =  Name$= uclPBFMTable��5�     >   PBFM> 5�     �� *PBFM+$ TwoWay=�5�     �� 5�     $
��FORM��6   .��5�     6   0MaddenTeamPlaybookEditor.User_Controls.FORMTable  -   5        ?  Name$? uclFORMTable��5�     @   FORM@ 5�     �� *FORM+$ TwoWay=�5�     �� 5�     $
��PBST��6   .��5�     6   0MaddenTeamPlaybookEditor.User_Controls.PBSTTable  -   5        A  Name$A uclPBSTTable��5�     B   PBSTB 5�     �� *PBST+$ TwoWay=�5�     �� 5�     $
��SETL��6   .��5�     6   0MaddenTeamPlaybookEditor.User_Controls.SETLTable  -    5        C  Name$C uclSETLTable��5�     D   SETLD 5      �� *SETL+$ TwoWay=�5     �� 5     $
��SETP��6   .��5     6   0MaddenTeamPlaybookEditor.User_Controls.SETPTable  -!   5        E  Name$E uclSETPTable��5     F   SETPF 5     �� *SETP+$ TwoWay=�5     �� 5	     $
��SPKF��6   .��5
     6   0MaddenTeamPlaybookEditor.User_Controls.SPKFTable  -"   5        G  Name$G uclSPKFTable��5     H   SPKFH 5     �� *SPKF+$ TwoWay=�5     �� 5     $
��SPKG��6   .��5     6   0MaddenTeamPlaybookEditor.User_Controls.SPKGTable  -#   5        I  Name$I uclSPKGTable��5     J   SPKGJ 5     �� *SPKG+$ TwoWay=�5     �� 5     $
��SGFM��6   .��5     6   0MaddenTeamPlaybookEditor.User_Controls.SGFMTable  -$   5        K  Name$K uclSGFMTable��5     L   SGFML 5     �� *SGFM+$ TwoWay=�5     �� 5     $
��SETG��6   .��5     6   0MaddenTeamPlaybookEditor.User_Controls.SETGTable  -%   5        M  Name$M uclSETGTable��5     N   SETGN 5     �� *SETG+$ TwoWay=�5     �� 5!     $
��PBPL��6   .��5"     6   0MaddenTeamPlaybookEditor.User_Controls.PBPLTable  -&   5        O  Name$O uclPBPLTable��5#     P   PBPLP 5$     �� *PBPL+$ TwoWay=�5%     �� 5'     $
��PLYL��6   .��5(     6   0MaddenTeamPlaybookEditor.User_Controls.PLYLTable  -'   5        Q  Name$Q uclPLYLTable��5)     R   PLYLR 5*     �� *PLYL+$ TwoWay=�5+     �� 5-     $
��PLPD��6   .��5.     6   0MaddenTeamPlaybookEditor.User_Controls.PLPDTable  -(   5        S  Name$S uclPLPDTable��5/     T   PLPDT 50     �� *PLPD+$ TwoWay=�51     �� 53     $
��PLRD��6   .��54     6   0MaddenTeamPlaybookEditor.User_Controls.PLRDTable  -)   5        U  Name$U uclPLRDTable��55     V   PLRDV 56     �� *PLRD+$ TwoWay=�57     �� 59     $
��PLYS��6   .��5:     6   0MaddenTeamPlaybookEditor.User_Controls.PLYSTable  -*   5        W  Name$W uclPLYSTable��5;     X   PLYSX 5<     �� *PLYS+$ TwoWay=�5=     �� 5?     $
��PSAL��6   .��5@     6   0MaddenTeamPlaybookEditor.User_Controls.PSALTable  -+   5        Y  Name$Y uclPSALTable��5A     Z   PSALZ 5B     �� *PSAL+$ TwoWay=�5C     �� 5E     $
��ARTL��6   .��5F     6   0MaddenTeamPlaybookEditor.User_Controls.ARTLTable  -,   5        [  Name$[ uclARTLTable��5G     \   ARTL\ 5H     �� *ARTL+$ TwoWay=�5I     �� 5K     $
��PBAI��6   .��5L     6    0MaddenTeamPlaybookEditor.User_Controls.PBAITable   --   5        ]   Name$] uclPBAITable��5M     ^    PBAI^ 5N     �� *PBAI+$ TwoWay=�5O     �� 5Q     $
��PBAU��6   .��5R     6!   0MaddenTeamPlaybookEditor.User_Controls.PBAUTable!  -.   5        _ ! Name$_ uclPBAUTable��5S     ` !  PBAU` 5T     �� *PBAU+$ TwoWay=�5U     �� 5W     $
��PBCC��6   .��5X     6"   0MaddenTeamPlaybookEditor.User_Controls.PBCCTable"  -/   5        a " Name$a uclPBCCTable��5Y     b "  PBCCb 5Z     �� *PBCC+$ TwoWay=�5[     �� 5]     $
��PLCM��6   .��5^     6#   0MaddenTeamPlaybookEditor.User_Controls.PLCMTable#  -0   5        c # Name$c uclPLCMTable��5_     d #  PLCMd 5`     �� *PLCM+$ TwoWay=�5a     �� 5c     $
��PPCT��6   .��5d     6$   0MaddenTeamPlaybookEditor.User_Controls.PPCTTable$  -1   5        e $ Name$e uclPPCTTable��5e     f $  PPCTf 5f     �� *PPCT+$ TwoWay=�5g     �� 5i     $
��SDEF��6   .��5j     6%   0MaddenTeamPlaybookEditor.User_Controls.SDEFTable%  -2   5        g % Name$g uclSDEFTable��5k     h %  SDEFh 5l     �� *SDEF+$ TwoWay=�5m     �� 5o     $
��SRFT��6   .��5p     6&   0MaddenTeamPlaybookEditor.User_Controls.SRFTTable&  -3   5        i & Name$i uclSRFTTable��5q     j &  SRFTj 5r     �� *SRFT+$ TwoWay=�5s     5u     5w     5y     5{     