   M S B A M L   `   `   `  ����Q  MMadden-Playbook-Editor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullY1clr-namespace:MaddenTeamPlaybookEditor.ViewModels#MaddenTeamPlaybookEditor.ViewModels  5       MathConverter.XamarinFormsQ?clr-namespace:HexInnovation;assembly=MathConverter.XamarinFormsHexInnovation 5      _4clr-namespace:MaddenTeamPlaybookEditor.User_Controls&MaddenTeamPlaybookEditor.User_Controls  5      >    8MaddenTeamPlaybookEditor.User_Controls.SubFormationModal   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      TTeamPlaybookViewModels1clr-namespace:MaddenTeamPlaybookEditor.ViewModels     5      Pmath?clr-namespace:HexInnovation;assembly=MathConverter.XamarinForms     5      MUserControls4clr-namespace:MaddenTeamPlaybookEditor.User_Controls     5      -   5          >�Name$  uclSubFormationModal��5       J� 	AllowDrop .  � 	Resources 5         MenuItemPanelTemplate �� 
TargetType �� Property �� Value �� 
TargetType �� CornerRadius J� SnapsToDevicePixels&   System.Windows.Controls.DataGrid=  7System.Windows.Controls.Primitives.DataGridColumnHeader:  4System.Windows.Controls.Primitives.DataGridRowHeader  
FieldBrush	 �� ImageSource
 �� BitmapScalingMode j� Stretch j� 
AlignmentY��%   &	        'm� =     7   '�� �     7   '  j    '�� �    '�� i    '  �    '  �    &	 !    �� 5   
   .R�5      �� $��	-20,0,0,0q�6   5      �� 5   
   " m�6   .�5      ��  � ��8   6+   5      �� 5   
   " ��6   .�5      ��  � ��8   6+   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� $ 10��6!   $��0q�63   
���/kU� . ._�5      �� 5      5      5      5      �� 5   
   "  6   .�5       ��  � ��
 ���� 6+   �� 5!       � ��
 ���� 6,   �� 5"       �@ RowBackground
 ���� 6.   �� 5#       � ��
 ����6+   �� 5$       �@ GridLinesVisibility$
 None=�64   �� 5%       �@ CanUserAddRows . 6/   �� 5&       �@ CanUserDeleteRows . 62   5'      �� 5(   
   " ��6   .�5)      ��  � ��
 ���� 6+   �� 5*       � ��
 ����6+   �� 5+       � ��$
 Bold"�6+   5,      �� 5-   
   " ��6   .�5.      ��  � ��
 ���� 6+   �� 5/       � ��
 ����6,   �� 50       � ��
 ����6+   51      �� 52   
   "  6   .�53      ��  � ��
 ���� 6+   �� 54       � ��$
 Bold"�6+   �� 55       � ��$ 30��6)   �� 56       � {� .  6*   57      �� 58   
   "  6   .�59      ��  � ��
 ���� 6+   �� 5:       � {� .  6*   5;      �� 5<   
   $!	 ../Resources/full_field.jpg��5>      $

 Fant=�5?      $ UniformToFill=�5@      $	 Top=�5A      5C      .��5E      �� -   5         ��Name$ cvsField��5E      $	��950��6   $	��533��6,   .+�5G   
   �� -   5        $��bdrField��5H      #��[ 5I      $ 10��5J      $	��533��5K      $	��950��5L      �� 5O   
   	 �� X1$ 0��6   	 �� Y1$ 599.5��6   	 �� X2$	 533��6!   	 �� Y2$ 599.5��6*   $��5��65   ��5P      �� 5Q       �� Color 5R      �� 5S       �� A$ 96��6     �� R$ 0��6'    �� G$ 0��6-    �� B$ 0��63   5U      5W      �� 5Y   
   $ 0��6   $ 499.5��6   $	 533��6!   $ 499.5��6*   $��5��65   ��5Z      �� 5[       5\      �� 5]      $ 80��6    $	 160��6'   $	 160��6/   $ 0��67   5_      5a      �� 5c   
   -   5         ��Name$ iclIcons��5e      {�.  �� Left$ 266.5��5g      
 �� Top$	 600��5h      ��5f      �� *PlayerPlayartView+ �� Mode$ TwoWay=���5i      �� 5j      .R�5k      �� $ 
cvsPlayers��6   5l      ��5n      �� 5o      .R�5p      �� .+�5q      7   1MaddenTeamPlaybookEditor.User_Controls.PlayerIcon    Name$ clnIcon��5r         Scale$ 2Q�5t         ShowPosition .    AbsolutePositioning .    	Draggable .     Player  5s      �� 5w      5x      5y      ��5{      �� 5|      .�5}      ��  �@��Left 5      �� *XY.X+�� 5�       �@��Top 5�      �� *XY.Y+! �� Triggers! 5�      P� 5�      " P� Property" �@J�IsMouseOver# P� Value# . . �5�      ��  �@J�Effect 5�   "   3  -System.Windows.Media.Effects.DropShadowEffect  5�   &   $   ShadowDepth$$ 0Q�67   %   Color$% White��6G   &   Opacity$& 1Q�6U   '   
BlurRadius$' 20Q�6a   5�      �� 5�       � z� 5�   "   �� 5�   &   ( �� ScaleX$( 2Q�65   ) �� ScaleY$) 2Q�6@   5�      5�      5�      5�      ]� 5�   
   $��0,0,0,0q�5�      $ 0��5�      $ 0��5�      $	��800��5�      $	��533��5�      ��.  .+�5�      �� -   5        * ��Name$* 	tabPlayer��5�      
������ 
������ $	��Top=�5�      $	��Top=�5�      $��Stretch=�5�       5�      + ��Name, �� Triggers- �� 
TargetName��%u  '��       �� 5�      " ��6   .�5�      ��  � �� 5�      �� 5�   "   " ��62   .R�5�   &   �� $��Panel��6,   .��5�   *   �� $+ ContentSite��6;   $	��Top=�5�   1   $��Center=�5�   1   $��Header��5�   1   $��114.5,2q�5�   1   5�   '   , 5�   &   P� 5�   *   " �@��
IsSelected# . . �5�   .   �� $- Panel��65    � ��
 ���� 6^   �� 5�   .   $- Panel��65    � ��
 ����6^   5�   +   P� 5�   *   " �@��
IsSelected# .  . �5�   .   �� $- Panel��65    � ��
 ���� 6^   �� 5�   .   $- Panel��65    � ��
 �   �6^   5�   +   5�   #   5�      5�      5�      .@�5�      �� $
��PBST��6   .��5�      � $��Center=�6   . � ColumnDefinitions. 5�      �� 5�      $
��Auto �6/   �� 5�      $
��Auto �6/   �� 5�      $
��Auto �6/   �� 5�      $
��Auto �6/   �� 5�      $
��Auto �6/   �� 5�      $
��Auto �6/   �� 5�      $
��Auto �6/   / � RowDefinitions/ 5�      �� 5�      �� 5�      .+�5�      �� $	��5,0q�6$   
������$��0��6I   $��0��6Y   $	��rec��6f   �� 5�      {�.  $��0��64   $��1��6D   ��6Q   �� *
PBST.rec+$ TwoWay=��� 5�      $	��5,0q�6$   
������$��1��6I   $��0��6Y   $
��SETL��6f   �� 5�      $��1��6"   $��1��62   ��6?   �� *	PBST.SETL+$ TwoWay=��� 5�      $	��5,0q�6$   
������$��2��6I   $��0��6Y   $
��PBFM��6f   �� 5�      $��2��6"   $��1��62   ��6?   �� *	PBST.PBFM+$ TwoWay=��� 5�      $	��5,0q�6$   
������$��3��6I   $��0��6Y   $
��pbst��6f   �� 5�      $��3��6"   $��1��62   ��6?   �� *	PBST.pbst+$ TwoWay=��� 5�      $	��5,0q�6$   
������$��4��6I   $��0��6Y   $
��SPF_��6f   �� 5�      $��4��6"   $��1��62   ��6?   �� *	PBST.SPF_+$ TwoWay=��� 5�      $	��5,0q�6$   
������$��5��6I   $��0��6Y   $
��ord_��6f   �� 5�      {�.  $��5��64   $��1��6D   ��6Q   �� *	PBST.ord_+$ TwoWay=��� 5�      $	��5,0q�6$   
������$��6��6I   $��0��6Y   $
��name��6f   �� 5�      $��6��6"   $��1��62   ��6?   �� *	PBST.name+$ TwoWay=�5�      5�      �� 5�      $
��SETL��6   .��5�      � $��Center=�6   . 5      �� 5     $
��Auto �6/   �� 5     $
��Auto �6/   �� 5     $
��Auto �6/   �� 5     $
��Auto �6/   �� 5     $
��Auto �6/   �� 5     $
��Auto �6/   �� 5     $
��Auto �6/   �� 5     $
��Auto �6/   �� 5	     $
��Auto �6/   �� 5
     $
��Auto �6/   / 5     �� 5     �� 5     .+�5     �� $	��5,0q�6$   
������$��0��6I   $��0��6Y   $	��rec��6f   �� 5     {�.  $��0��64   $��1��6D   ��6Q   �� *
SETL.rec+$ TwoWay=��� 5     $	��5,0q�6$   
������$��1��6I   $��0��6Y   $
��setl��6f   �� 5     $��1��6"   $��1��62   ��6?   �� *	SETL.setl+$ TwoWay=��� 5     $	��5,0q�6$   
������$��2��6I   $��0��6Y   $
��FORM��6f   �� 5     $��2��6"   $��1��62   ��6?   �� *	SETL.FORM+$ TwoWay=��� 5     $	��5,0q�6$   
������$��3��6I   $��0��6Y   $
��MOTN��6f   �� 5     $��3��6"   $��1��62   ��6?   �� *	SETL.MOTN+$ TwoWay=��� 5     $	��5,0q�6$   
������$��4��6I   $��0��6Y   $
��CLAS��6f   �� 5     $��4��6"   $��1��62   ��6?   �� *	SETL.CLAS+$ TwoWay=��� 5     $	��5,0q�6$   
������$��5��6I   $��0��6Y   $
��SETT��6f   �� 5     $��5��6"   $��1��62   ��6?   �� *	SETL.SETT+$ TwoWay=��� 5     $	��5,0q�6$   
������$��6��6I   $��0��6Y   $
��SITT��6f   �� 5     $��6��6"   $��1��62   ��6?   �� *	SETL.SITT+$ TwoWay=��� 5     $	��5,0q�6$   
������$��7��6I   $��0��6Y   $
��SLF_��6f   �� 5     $��7��6"   $��1��62   ��6?   �� *	SETL.SLF_+$ TwoWay=��� 5      $	��5,0q�6$   
������$��8��6I   $��0��6Y   $
��name��6f   �� 5!     $��8��6"   $��1��62   ��6?   �� *	SETL.name+$ TwoWay=��� 5"     $	��5,0q�6$   
������$��9��6I   $��0��6Y   $
��poso��6f   �� 5#     $��9��6"   $��1��62   ��6?   �� *	SETL.poso+$ TwoWay=�5$     5%     5&     5(     ]� 5*  
   -   5        0 ]�Name$0 ReferenceInfo��5*  _   $��Stretch=�6   $��Stretch=�60   $��0,0,0,0q�6N   $ 0��6v   $ 0��6�   ��6�   �� *ActualWidth+1 �� ElementName$1 cvsField����6�   �� *ActualHeight+$1 cvsField��.+�5+     �� -   5        $* tabAlignments��5,     
������ 
������ $��Bottom=�50     $��Center=�51     ��5-     �� *
Alignments+��54     �� 55     2 �� DataType8   2MaddenTeamPlaybookEditor.ViewModels.SubFormationVM"2  6#   .R�56     �� 3 ��Name$3 tabAlignment��6$   ��6:   �� *	SGFM.name+57     4 �� ContentTemplate4 59     �� 5:     ��5<     �� 5=     " ��6     FormationTabItem5 �� BasedOn#5 [ 6:   6h   5?     5@     5B     5D     