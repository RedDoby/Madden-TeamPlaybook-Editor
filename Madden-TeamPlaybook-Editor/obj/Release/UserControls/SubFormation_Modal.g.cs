﻿#pragma checksum "..\..\..\UserControls\SubFormation_Modal.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "926E9E39D92222EAF73DA3837B4BB3699DD46E52A2A838E0F1ED4B9F48E44AAB"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using HexInnovation;
using MaddenTeamPlaybookEditor.User_Controls;
using MaddenTeamPlaybookEditor.ViewModels;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace MaddenTeamPlaybookEditor.User_Controls {
    
    
    /// <summary>
    /// SubFormationModal
    /// </summary>
    public partial class SubFormationModal : System.Windows.Controls.UserControl, System.Windows.Markup.IComponentConnector {
        
        
        #line 8 "..\..\..\UserControls\SubFormation_Modal.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal MaddenTeamPlaybookEditor.User_Controls.SubFormationModal uclSubFormationModal;
        
        #line default
        #line hidden
        
        
        #line 69 "..\..\..\UserControls\SubFormation_Modal.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Canvas cvsField;
        
        #line default
        #line hidden
        
        
        #line 72 "..\..\..\UserControls\SubFormation_Modal.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Border bdrField;
        
        #line default
        #line hidden
        
        
        #line 101 "..\..\..\UserControls\SubFormation_Modal.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ItemsControl iclIcons;
        
        #line default
        #line hidden
        
        
        #line 190 "..\..\..\UserControls\SubFormation_Modal.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TabControl tabPlayer;
        
        #line default
        #line hidden
        
        
        #line 298 "..\..\..\UserControls\SubFormation_Modal.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DockPanel ReferenceInfo;
        
        #line default
        #line hidden
        
        
        #line 300 "..\..\..\UserControls\SubFormation_Modal.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TabControl tabAlignments;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/Madden-Playbook-Editor;component/usercontrols/subformation_modal.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\UserControls\SubFormation_Modal.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.uclSubFormationModal = ((MaddenTeamPlaybookEditor.User_Controls.SubFormationModal)(target));
            return;
            case 2:
            this.cvsField = ((System.Windows.Controls.Canvas)(target));
            return;
            case 3:
            this.bdrField = ((System.Windows.Controls.Border)(target));
            return;
            case 4:
            this.iclIcons = ((System.Windows.Controls.ItemsControl)(target));
            return;
            case 5:
            this.tabPlayer = ((System.Windows.Controls.TabControl)(target));
            return;
            case 6:
            this.ReferenceInfo = ((System.Windows.Controls.DockPanel)(target));
            return;
            case 7:
            this.tabAlignments = ((System.Windows.Controls.TabControl)(target));
            
            #line 306 "..\..\..\UserControls\SubFormation_Modal.xaml"
            this.tabAlignments.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.tabAlignments_SelectionChanged);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

