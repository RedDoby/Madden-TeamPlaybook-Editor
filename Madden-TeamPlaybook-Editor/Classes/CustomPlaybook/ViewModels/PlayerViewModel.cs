﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Windows.Shapes;
using TDBAccess;
using Madden.TeamPlaybook;
using System.Windows;
using System.Windows.Media;
using System.Globalization;

namespace MaddenCustomPlaybookEditor.ViewModels
{
    [Serializable]
    public class PlayerVM : INotifyPropertyChanged
    {
        public override string ToString()
        {
            string PlayerVM_string = EPos + " " + DPos + "\n";
            PlayerVM_string += SETP.ToString() + "\n";
            PlayerVM_string += SETG.ToString() + "\n";
            foreach (Madden.TeamPlaybook.PSAL psal in PSAL) PlayerVM_string += psal.ToString() + "\n";
            //PlayerVM_string += "Rec#: " + ARTL.rec + "\tartl: " + ARTL.artl + "\tacnt: " + ARTL.acnt + "\n";
            PlayerVM_string += ARTL.ToString();
            return PlayerVM_string;
        }

        public PlayVM Play { get; set; }

        public Madden.TeamPlaybook.PLYS PLYS { get; set; }
        public Madden.TeamPlaybook.SETP SETP { get; set; }
        public Madden.TeamPlaybook.SETG SETG { get; set; }
        public Madden.TeamPlaybook.SRFT SRFT { get; set; }
        public List<Madden.TeamPlaybook.PSAL> PSAL { get; set; }
        public Madden.TeamPlaybook.ARTL ARTL { get; set; }
        public Point XY { get; set; }

        public string DPos { get; set; }
        public string EPos { get; set; }
        public int Speed { get; set; }

        [field: NonSerializedAttribute()]
        public PathGeometry Icon { get; set; }
        [field: NonSerializedAttribute()]
        public ARTLColor artlColor { get; set; }
        [field: NonSerializedAttribute()]
        public List<Path> ARTLpath { get; set; }
        [field: NonSerializedAttribute()]
        public List<Path> PSALpath { get; set; }
        [field: NonSerializedAttribute()]
        public PathGeometry RouteCap { get; set; }

        public PlayerVM(Madden.CustomPlaybook.PLYS plys, PlayVM _Play)
        {
            Play = _Play;
            PLYS = Play.PLYS.Where(player => player.poso == plys.poso).FirstOrDefault();
            GetAssignment();
            GetARTL();
            GetPSAL();
            GetRouteCap();
            GetAttributes();
            //if (PSAL.Where(step => step.code == 47).FirstOrDefault() != null && EPos == "FS")
            //{
            //    if (PSAL.Where(step => step.code == 47).FirstOrDefault().val2 < 30)
            //    {
            //        Console.WriteLine(Play.SubFormation.Formation.PBFM[0].name + " " + Play.SubFormation.PBST[0].name + " - " + Play.PBPL.name);
            //    }
            //}
        }

        public void GetAssignment()
        {
            SETP = Play.SubFormation.CurrentPackage.Where(set => set.poso == PLYS.poso).FirstOrDefault();
            Madden.CustomPlaybook.SETG _SETG = Play.SubFormation.CurrentAlignment.SETG.Where(set => set.SETP == SETP.setp).FirstOrDefault();
            SETG = new Madden.TeamPlaybook.SETG
            {
                rec = _SETG.rec,
                anm_ = _SETG.anm_,
                dir_ = _SETG.dir_,
                fanm = _SETG.fanm,
                fdir = _SETG.fdir,
                fx__ = _SETG.fx__,
                fy__ = _SETG.fy__,
                setg = 0,
                SETP = _SETG.SETP,
                SF__ = _SETG.SF__,
                SGF_ = _SETG.SGF_,
                x___ = _SETG.x___,
                y___ = _SETG.y___
            };
            SRFT = Play.SRFT.Where(assignment => assignment.PLYR == PLYS.poso).FirstOrDefault();
            EPos = CustomPlaybook.Positions[Play.SubFormation.CurrentPackage.Where(poso => poso.poso == PLYS.poso).FirstOrDefault().EPos];
            DPos = Play.SubFormation.CurrentPackage.Where(poso => poso.poso == PLYS.poso).FirstOrDefault().DPos.ToString();
            XY = new Point { X = SETG.x___ * 11.4286, Y = SETG.y___ * -10 };
        }

        public void GetPSAL()
        {
            PSAL = new List<Madden.TeamPlaybook.PSAL>();
            if (Play.SubFormation.Formation.FORM.FTYP == 1 || Play.SubFormation.Formation.FORM.FTYP == 2 || Play.SubFormation.Formation.FORM.FTYP == 3)
            {
                foreach (Madden.CustomPlaybook.PSAL step in Play.SubFormation.Formation.Playbook.PSLO.Where(step => step.psal == PLYS.PSAL))
                    PSAL.Add(new Madden.TeamPlaybook.PSAL
                    {
                        rec = step.rec,
                        code = step.code,
                        psal = step.psal,
                        step = step.step,
                        val1 = step.val1,
                        val2 = step.val2,
                        val3 = step.val3
                    });
            }
            else
            {
                foreach (Madden.CustomPlaybook.PSAL step in Play.SubFormation.Formation.Playbook.PSLD.Where(step => step.psal == PLYS.PSAL))
                    PSAL.Add(new Madden.TeamPlaybook.PSAL
                    {
                        rec = step.rec,
                        code = step.code,
                        psal = step.psal,
                        step = step.step,
                        val1 = step.val1,
                        val2 = step.val2,
                        val3 = step.val3
                    });
            }
            PSAL = PSAL.OrderBy(step => step.step).ToList();
            PSALpath = ConvertPSAL(PSAL);

            if (PSAL.Count == 0)
            {
                MessageBox.Show(
                    Play.SubFormation.Formation.FORM.name + " " +
                    Play.SubFormation.SETL.name + " - " +
                    Play.PBPL.name + "\n\n" +
                    DPos + EPos +
                    "\nPSAL: " + PLYS.PSAL +
                    "\nARTL: " + PLYS.ARTL,
                    "Missing PSAL"
                    );
            }

            foreach (Path path in PSALpath) ((PathGeometry)path.Data).Freeze();
        }

        public void UpdateXY(Point point)
        {
            Madden.TeamPlaybook.PSAL psal = this.PSAL.Where(step => step.code == 48).LastOrDefault();
            if (psal != null)
            {
                //X to val1 = 51/90 = .5667
                //Y to val2 = 3/8 = .375
                psal.val1 = (int)(point.X * .5667);
                psal.val2 = (int)(point.Y * -.375);
            }
            else
            {
                this.SETG.x___ = (float)(point.X * .0875);
                this.SETG.y___ = (float)(point.Y * -.1);
                this.Play.SubFormation.CurrentAlignment.SETG.Where(set => set.rec == this.SETG.rec).LastOrDefault().x___ = this.SETG.x___;
                this.Play.SubFormation.CurrentAlignment.SETG.Where(set => set.rec == this.SETG.rec).LastOrDefault().y___ = this.SETG.y___;
                XY = new Point { X = SETG.x___ * 11.4286, Y = SETG.y___ * -10 };
            }
        }

        public void UpdatePSAL(PSAL psal, Point point)
        {
            switch (psal.code)
            {
                default:
                    break;
            }
            PSALpath = ConvertPSAL(PSAL);
            foreach (Path path in PSALpath) ((PathGeometry)path.Data).Freeze();
        }

        public void GetARTL()
        {
            #region ARTL

            if (Play.SubFormation.Formation.FORM.FTYP == 1 || Play.SubFormation.Formation.FORM.FTYP == 2 || Play.SubFormation.Formation.FORM.FTYP == 3)
            {
                Madden.CustomPlaybook.ARTL _ARTL = Play.SubFormation.Formation.Playbook.ARTO.FirstOrDefault(step => step.artl == PLYS.ARTL);
                List<Madden.TeamPlaybook.PlayArt> _playart = new List<PlayArt>();
                foreach (Madden.CustomPlaybook.PlayArt step in _ARTL.ARTList)
                {
                    _playart.Add(new PlayArt
                    {
                        at = step.at,
                        au = step.au,
                        av = step.av,
                        ax = step.ax,
                        ay = step.ay,
                        ct = step.ct,
                        ls = step.ls,
                        lt = step.lt,
                        sp = step.sp
                    });
                }
                ARTL = new Madden.TeamPlaybook.ARTL
                {
                    rec = _ARTL.rec,
                    acnt = _ARTL.acnt,
                    artl = _ARTL.artl,
                    ARTList = _playart
                };
            }
            else
            {
                Madden.CustomPlaybook.ARTL _ARTL = Play.SubFormation.Formation.Playbook.ARTD.FirstOrDefault(step => step.artl == PLYS.ARTL);
                List<Madden.TeamPlaybook.PlayArt> _playart = new List<PlayArt>();
                foreach (Madden.CustomPlaybook.PlayArt step in _ARTL.ARTList)
                {
                    _playart.Add(new PlayArt
                    {
                        at = step.at,
                        au = step.au,
                        av = step.av,
                        ax = step.ax,
                        ay = step.ay,
                        ct = step.ct,
                        ls = step.ls,
                        lt = step.lt,
                        sp = step.sp
                    });
                }
                ARTL = new Madden.TeamPlaybook.ARTL
                {
                    rec = _ARTL.rec,
                    acnt = _ARTL.acnt,
                    artl = _ARTL.artl,
                    ARTList = _playart
                };
            }

            if (ARTL == null)
            {
                //MessageBox.Show(
                //    Play.SubFormation.Formation.FORM.name + " " +
                //    Play.SubFormation.SETL.name + " - " +
                //    Play.PBPL.name + "\n\n" +
                //    DPos + EPos +
                //    "\nPSAL: " + PLYS.PSAL +
                //    "\nARTL: " + PLYS.ARTL,
                //    "Missing ARTL"
                //);

                ARTL = new Madden.TeamPlaybook.ARTL
                {
                    ARTList = new List<PlayArt>()
                };
            }
            else
            {
                ARTLpath = new List<Path>();
                List<int> routeIndices = new List<int>();
                for (int i = 0; i <= 11; i++)
                {
                    if (ARTL.ARTList[i].ct != 0)
                    {
                        routeIndices.Add(i);
                    }
                }
                int optionStartIndex =
                    routeIndices.Count != 0 ?
                    routeIndices[0] == 0 ?
                    0 :
                    routeIndices[0] - 1 :
                    0;

                foreach (int step in routeIndices)
                {
                    PathGeometry RouteGeo = new PathGeometry();
                    PathFigure RouteFigure = new PathFigure();
                    PathSegmentCollection RouteSegments = new PathSegmentCollection();
                    RouteFigure.Segments = RouteSegments;
                    RouteGeo.Figures.Add(RouteFigure);
                    PointCollection RoutePoints = new PointCollection();
                    ARTLpath.Add(new Path());
                    ARTLpath[ARTLpath.Count - 1].Data = RouteGeo;

                    if (routeIndices.IndexOf(step) == 0)
                    {
                        RouteFigure.StartPoint = new Point { X = 0, Y = 0 };
                    }
                    else
                    {
                        RouteFigure.StartPoint =
                            ARTL.ARTList[optionStartIndex].au == 0 && ARTL.ARTList[optionStartIndex].av == 0 ?
                            new Point { X = ARTL.ARTList[optionStartIndex].ax, Y = ARTL.ARTList[optionStartIndex].ay } :
                            new Point { X = ARTL.ARTList[optionStartIndex].au, Y = ARTL.ARTList[optionStartIndex].av };
                    }

                    for (int i = routeIndices.IndexOf(step) == 0 ? 0 : routeIndices[routeIndices.IndexOf(step) - 1] + 1; i <= step; i++)
                    {
                        if (ARTL.ARTList[i].au == 0 && ARTL.ARTList[i].av == 0)
                        {
                            RoutePoints.Add(new Point { X = ARTL.ARTList[i].ax, Y = ARTL.ARTList[i].ay });
                            PolyLineSegment line_segment = new PolyLineSegment();
                            line_segment.IsSmoothJoin = true;
                            RouteSegments.Add(line_segment);

                            if (ARTL.ARTList[i].ct != 0 || ARTL.ARTList[i + 1].au != 0 || ARTL.ARTList[i + 1].av != 0)
                            {
                                line_segment.Points = RoutePoints.Clone();
                                RoutePoints.Clear();
                            }
                        }
                        else
                        {
                            if (i == 0)
                            {
                                RoutePoints.Add(new Point { X = 0, Y = 0 });
                            }
                            else
                            {
                                if (ARTL.ARTList[i - 1].au == 0 && ARTL.ARTList[i - 1].av == 0)
                                {
                                    RoutePoints.Add(new Point { X = ARTL.ARTList[i - 1].ax, Y = ARTL.ARTList[i - 1].ay });
                                }
                                else
                                {
                                    RoutePoints.Add(new Point { X = ARTL.ARTList[i - 1].au, Y = ARTL.ARTList[i - 1].av });
                                }
                            }

                            RoutePoints.Add(new Point { X = ARTL.ARTList[i].ax, Y = ARTL.ARTList[i].ay });
                            RoutePoints.Add(new Point { X = ARTL.ARTList[i].au, Y = ARTL.ARTList[i].av });

                            PolyBezierSegment bezier_segment = new PolyBezierSegment();
                            bezier_segment.IsSmoothJoin = true;
                            RouteSegments.Add(bezier_segment);

                            if (ARTL.ARTList[i].ct != 0)
                            {
                                bezier_segment.Points = RoutePoints.Clone();
                                RoutePoints.Clear();
                            }
                        }
                    }
                }
            }

            foreach (Path path in ARTLpath) ((PathGeometry)path.Data).Freeze();

            #endregion

            #region Icon

            switch (Play.SubFormation.CurrentPackage.Where(set => set.poso == PLYS.poso).FirstOrDefault().arti)
            {
                case 0://X
                    FormattedText X = new FormattedText(
                        "x",
                        CultureInfo.GetCultureInfo("en-us"),
                        FlowDirection.LeftToRight,
                        new Typeface(new FontFamily("Tahoma"), FontStyles.Normal, FontWeights.Black, FontStretches.Normal),
                        16,
                        new SolidColorBrush(Madden.TeamPlaybook.ARTLColor.PlayerIconColor)
                        );
                    Icon = X.BuildGeometry(new Point(-4, -12)).GetFlattenedPathGeometry();
                    break;
                case 1://Circle
                    Icon = new EllipseGeometry(new Point(0, 0), 4, 4).GetFlattenedPathGeometry();
                    break;
                case 2://Square
                    Icon = new RectangleGeometry(new Rect(new Point(-4, -4), new Size(8, 8))).GetFlattenedPathGeometry();
                    break;
                case 4://Circle
                    Icon = new EllipseGeometry(new Point(0, 0), 4, 4).GetFlattenedPathGeometry();
                    break;
                case 5://Square
                    Icon = new RectangleGeometry(new Rect(new Point(-4, -4), new Size(8, 8))).GetFlattenedPathGeometry();
                    break;
                default:
                    Icon = new EllipseGeometry(new Point(0, 0), 4, 4).GetFlattenedPathGeometry();
                    break;
            }

            #endregion

            #region Color

            artlColor =
                PLYS.poso != 0 ?
                Play.PLYL.vpos == PLYS.poso ?
                artlColor = ARTLColor.PrimaryRoute :
                artlColor = ARTLColor.Undefined :
                artlColor = ARTLColor.Undefined
                ;

            //switch (ARTL.acnt)
            //{
            //    default:
            //        artlColor = new ARTLColor(Colors.BlueViolet);
            //        break;
            //}

            #endregion
        }

        public void GetRouteCap()
        {
            if (artlColor.Equals(ARTLColor.Block))
            {
                RouteCap = new RectangleGeometry(new Rect(new Point(0, -6), new Size(3, 12))).GetFlattenedPathGeometry();
            }
            else
            {
                //Get Zone Size
                int EndOfList = ARTL.ARTList.FindIndex(playart => playart.ct != 0);
                if (EndOfList < 0) EndOfList = 0;
                switch (ARTL.ARTList[EndOfList].ct)
                {
                    case 3: //Deep quarter, hook, flat
                        RouteCap = Madden.TeamPlaybook.ARTL.QuarterHookFlat;
                        break;

                    case 4: //Deep third
                        RouteCap = Madden.TeamPlaybook.ARTL.DeepThird;
                        break;

                    case 5: //Deep half
                        RouteCap = Madden.TeamPlaybook.ARTL.DeepHalf;
                        break;

                    case 6: //QB spy
                        RouteCap = Madden.TeamPlaybook.ARTL.QBSpy;
                        break;
                    
                    default: //Arrow
                        RouteCap = Madden.TeamPlaybook.ARTL.Arrow;
                        break;
                }
            }
        }

        public void GetAttributes()
        {
            switch (EPos)
            {
                case "QB"://X
                    Speed = 65;
                    break;
                case "HB"://X
                    Speed = 89;
                    break;
                case "FB"://X
                    Speed = 70;
                    break;
                case "WR"://X
                    Speed = 92;
                    break;
                case "TE"://X
                    Speed = 82;
                    break;
                case "LT"://X
                    Speed = 65;
                    break;
                case "LG"://X
                    Speed = 65;
                    break;
                case "C"://X
                    Speed = 65;
                    break;
                case "RG"://X
                    Speed = 65;
                    break;
                case "RT"://X
                    Speed = 65;
                    break;
                case "LE"://X
                    Speed = 75;
                    break;
                case "RE"://X
                    Speed = 75;
                    break;
                case "DT"://X
                    Speed = 65;
                    break;
                case "LOLB"://X
                    Speed = 80;
                    break;
                case "MLB"://X
                    Speed = 80;
                    break;
                case "ROLB"://X
                    Speed = 80;
                    break;
                case "CB"://X
                    Speed = 90;
                    break;
                case "FS"://X
                    Speed = 90;
                    break;
                case "SS"://X
                    Speed = 85;
                    break;
                case "K"://X
                    Speed = 65;
                    break;
                case "P"://X
                    Speed = 65;
                    break;
                case "KR"://X
                    Speed = 9905;
                    break;
                case "PR"://X
                    Speed = 90;
                    break;
                case "KOS"://X
                    Speed = 65;
                    break;
                case "LS"://X
                    Speed = 65;
                    break;
                case "3RB"://X
                    Speed = 89;
                    break;
                case "PRB"://X
                    Speed = 85;
                    break;
                case "SWR"://X
                    Speed = 90;
                    break;
                case "RLE"://X
                    Speed = 80;
                    break;
                case "RRE"://X
                    Speed = 80;
                    break;
                case "RDT"://X
                    Speed = 75;
                    break;
                case "SLB"://X
                    Speed = 80;
                    break;
                case "SCB"://X
                    Speed = 90;
                    break;
                default:
                    Speed = 70;
                    break;
            }
        }

        public List<Path> ConvertPSAL(List<Madden.TeamPlaybook.PSAL> PSAL, Point LOS = new Point(), bool flipPSAL = false)
        {
            List<Path> PSALpath = new List<Path>();
            PathGeometry RouteGeo = new PathGeometry();
            PathFigure RouteFigure = new PathFigure();
            PathSegmentCollection RouteSegments = new PathSegmentCollection();
            RouteFigure.Segments = RouteSegments;
            RouteGeo.Figures.Add(RouteFigure);
            PointCollection RoutePoints = new PointCollection();
            PSALpath.Add(new Path());
            PSALpath[PSALpath.Count - 1].Data = RouteGeo;
            RouteFigure.StartPoint = new Point { X = 0, Y = 0 };
            PolyLineSegment line_segment = new PolyLineSegment();
            line_segment.IsSmoothJoin = true;
            RouteSegments.Add(line_segment);
            line_segment.Points = RoutePoints;
            Point Offset = new Point { X = 0, Y = 0 };

            for (int i = 0; i < PSAL.Count; i++)
            {
                switch (PSAL[i].code)
                {
                    case 1:
                        #region Run To End Zone

                        break;

                    #endregion

                    case 2:
                        #region Chase Ball

                        break;

                    #endregion

                    case 3:
                        #region MoveDirDist

                        if (RoutePoints.Count > 0) Offset = RoutePoints[RoutePoints.Count - 1];
                        RoutePoints.Add(MoveDistDirToXY(PSAL[i].val1, PSAL[i].val2, Offset, flipPSAL));
                        if (artlColor.Equals(ARTLColor.Undefined)) artlColor = ARTLColor.BaseRoute;
                        break;

                    #endregion

                    case 4:
                        #region MoveDirDistConst

                        if (RoutePoints.Count > 0) Offset = RoutePoints[RoutePoints.Count - 1];
                        RoutePoints.Add(MoveDistDirToXY(PSAL[i].val1, PSAL[i].val2, Offset, flipPSAL));
                        if (artlColor.Equals(ARTLColor.Undefined)) artlColor = ARTLColor.BaseRoute;
                        break;

                    #endregion

                    case 5:
                        #region Face Direction

                        break;

                    #endregion

                    case 7:
                        #region QB Scramble

                        artlColor = ARTLColor.QBScramble;
                        break;

                    #endregion

                    case 8:
                        #region Receiver Run Route

                        //convert to offest
                        if (RoutePoints.Count > 0) Offset = RoutePoints[RoutePoints.Count - 1];
                        RoutePoints.Add(MoveDistDirToXY(PSAL[i].val1, PSAL[i].val2, Offset, flipPSAL));

                        //if (RoutePoints[RoutePoints.Count - 1].X < 50 || RoutePoints[RoutePoints.Count - 1].X > 483)
                        //{
                        //    RoutePoints[RoutePoints.Count - 1] = MoveDistDirToXY(60, PSAL[i].val2, Offset, flipPSAL);
                        //}

                        if (artlColor.Equals(ARTLColor.Undefined)) artlColor = ARTLColor.BaseRoute;
                        break;

                    #endregion

                    case 9:
                        #region Receiver Cut Move

                        int playerDirection = 32; 

                        if (RoutePoints.Count > 0) Offset = RoutePoints[RoutePoints.Count - 1];
                        if (i == 0)
                        {
                            playerDirection = 32;
                        }
                        else if (PSAL[i - 1].code == 3 || PSAL[i - 1].code == 4 || PSAL[i - 1].code == 8 )
                        {
                            playerDirection = PSAL[i - 1].val2;
                        }

                        //1 = 45 degrees
                        if (PSAL[i].val2 == 1)
                        {
                            if (PSAL[i].val1 == 1)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(playerDirection - (45 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                            else if (PSAL[i].val1 == 2)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(playerDirection + (45 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                        }

                        //2 = 90 degrees
                        if (PSAL[i].val2 == 2)
                        {
                            if (PSAL[i].val1 == 1)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(playerDirection - (90 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                            else if (PSAL[i].val1 == 2)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(playerDirection + (90 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                        }

                        //3 = 22 degrees
                        if (PSAL[i].val2 == 3)
                        {
                            if (PSAL[i].val1 == 1)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(playerDirection - (22 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                            else if (PSAL[i].val1 == 2)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(playerDirection + (22 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                        }

                        //4 = 67 degrees
                        if (PSAL[i].val2 == 4)
                        {
                            if (PSAL[i].val1 == 1)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(playerDirection - (67 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                            else if (PSAL[i].val1 == 2)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(playerDirection + (67 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                        }

                        //5 = Curl
                        if (PSAL[i].val2 == 5)
                        {
                            if (PSAL[i].val1 == 1)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(playerDirection - (135 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                            else if (PSAL[i].val1 == 2)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(playerDirection + (135 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                        }

                        //7 = HitchComback, 8 = HitchGoIn and 9 = HitchGoOut
                        if (PSAL[i].val2 == 7 || PSAL[i].val2 == 8 || PSAL[i].val2 == 9)
                        {
                            if (PSAL[i].val1 == 1)
                            {
                                RoutePoints.Add(MoveDistDirToXY(8, (int)(playerDirection - (105 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                            else if (PSAL[i].val1 == 2)
                            {
                                RoutePoints.Add(MoveDistDirToXY(8, (int)(playerDirection + (105 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                        }

                        //10 = OutAndUp
                        if (PSAL[i].val2 == 10)
                        {
                            if (PSAL[i].val1 == 1)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(playerDirection - (105 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                            else if (PSAL[i].val1 == 2)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(playerDirection + (105 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                        }

                        //11 = Smash and 17 = SmashQuick
                        if (PSAL[i].val2 == 11 || PSAL[i].val2 == 17)
                        {
                            if (PSAL[i].val1 == 1)
                            {
                                RoutePoints.Add(MoveDistDirToXY(16, (int)(-10 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL));
                            }
                            else if (PSAL[i].val1 == 2)
                            {
                                RoutePoints.Add(MoveDistDirToXY(16, (int)(190 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL));
                            }
                        }

                        //13 = WRScrn
                        if (PSAL[i].val2 == 13)
                        {
                            if (PSAL[i].val1 == 1)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(-15 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL));
                            }
                            else if (PSAL[i].val1 == 2)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(195 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL));
                            }

                            //assign route color
                            if (artlColor.Equals(ARTLColor.Undefined))
                            {
                                artlColor = ARTLColor.BaseRoute;
                            }
                        }

                        //14 = 90Inside
                        if (PSAL[i].val2 == 14)
                        {
                            if (PSAL[i].val1 == 1)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(0 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL));
                            }
                            else if (PSAL[i].val1 == 2)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(180 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL));
                            }
                        }

                        //16 = 180Partial
                        if (PSAL[i].val2 == 16)
                        {
                            RoutePoints.Add(MoveDistDirToXY(16, (int)(270 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL));
                        }

                        //18 = Hitch
                        if (PSAL[i].val2 == 18)
                        {
                            if (PSAL[i].val1 == 1)
                            {
                                RoutePoints.Add(MoveDistDirToXY(16, (int)(playerDirection - (105 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                            else if (PSAL[i].val1 == 2)
                            {
                                RoutePoints.Add(MoveDistDirToXY(16, (int)(playerDirection + (105 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                        }

                        //20 = ShakeCut
                        if (PSAL[i].val2 == 20)
                        {
                            if (PSAL[i].val1 == 1)
                            {
                                RoutePoints.Add(MoveDistDirToXY(8, (int)(playerDirection + (67 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                            else if (PSAL[i].val1 == 2)
                            {
                                RoutePoints.Add(MoveDistDirToXY(8, (int)(playerDirection - (67 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                        }

                        //21 = StutterCut
                        if (PSAL[i].val2 == 21)
                        {
                            if (PSAL[i].val1 == 1)
                            {
                                RoutePoints.Add(MoveDistDirToXY(8, (int)(playerDirection - (67 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                            else if (PSAL[i].val1 == 2)
                            {
                                RoutePoints.Add(MoveDistDirToXY(8, (int)(playerDirection + (67 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                        }

                        //22 = HingeCut
                        if (PSAL[i].val2 == 22)
                        {
                            if (PSAL[i].val1 == 1)
                            {
                                RoutePoints.Add(MoveDistDirToXY(16, (int)(145 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL));
                            }
                            else if (PSAL[i].val1 == 2)
                            {
                                RoutePoints.Add(MoveDistDirToXY(16, (int)(35 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL));
                            }
                        }

                        //23 = PostCorner
                        if (PSAL[i].val2 == 23)
                        {
                            if (PSAL[i].val1 == 1)
                            {
                                RoutePoints.Add(MoveDistDirToXY(48, (int)(playerDirection + (45 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                            else if (PSAL[i].val1 == 2)
                            {
                                RoutePoints.Add(MoveDistDirToXY(48, (int)(playerDirection - (45 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                        }

                        //25 = StutterStreak
                        if (PSAL[i].val2 == 25)
                        {
                            if (PSAL[i].val1 == 1)
                            {
                                RoutePoints.Add(MoveDistDirToXY(4, (int)(playerDirection + (90 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                            else if (PSAL[i].val1 == 2)
                            {
                                RoutePoints.Add(MoveDistDirToXY(4, (int)(playerDirection - (90 * Madden.TeamPlaybook.PSAL.AngleRatio)), Offset, flipPSAL));
                            }
                        }

                        //26 = WR Swing
                        if (PSAL[i].val2 == 26)
                        {
                            if (PSAL[i].val1 == 1)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(-35 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL));
                                Offset = RoutePoints[RoutePoints.Count - 1];
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(0 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL));
                            }
                            else if (PSAL[i].val1 == 2)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(215 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL));
                                Offset = RoutePoints[RoutePoints.Count - 1];
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(180 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL));
                            }
                        }

                        //28 = Sluggo
                        if (PSAL[i].val2 == 28)
                        {
                            if (PSAL[i].val1 == 1)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(22 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL));
                            }
                            else if (PSAL[i].val1 == 2)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(158 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL));
                            }
                        }

                        //29 = Out n Up
                        if (PSAL[i].val2 == 29)
                        {
                            if (PSAL[i].val1 == 1)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(180 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL));
                            }
                            else if (PSAL[i].val1 == 2)
                            {
                                RoutePoints.Add(MoveDistDirToXY(24, (int)(0 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL));
                            }
                        }

                        if (artlColor.Equals(ARTLColor.Undefined)) artlColor = ARTLColor.BaseRoute;

                        break;

                    #endregion

                    case 10:
                        #region Receiver Get Open

                        break;

                    #endregion

                    case 11:
                        #region Pitch Ball?

                        artlColor = ARTLColor.QBHandoff;
                        break;

                    #endregion

                    case 12:
                        #region Option Handoff

                        artlColor = ARTLColor.QBHandoff;
                        break;

                    #endregion

                    case 13:
                        #region Receive Hand Off

                        if (RoutePoints.Count > 0) Offset = RoutePoints[RoutePoints.Count - 1];
                        RoutePoints.Add(MoveDistDirToXY(PSAL[i].val1, PSAL[i].val2, Offset, flipPSAL));
                        artlColor = ARTLColor.Run;
                        break;

                    #endregion

                    case 14:
                        #region PassBlock

                        if (PSAL[i].val1 == 0)
                        {
                            //assign route color
                            artlColor = ARTLColor.Block;

                            //manual offset of 2 yards back
                            if (i == 0)
                            {
                                RoutePoints.Add(MoveDistDirToXY(12, 96, Offset, flipPSAL));
                            }
                        }
                        else
                        {
                            //assign route color
                            artlColor = 
                                PSAL[i + 1].code != 255 ?
                                ARTLColor.DelayRoute :
                                artlColor = ARTLColor.Block;
                        }

                        break;

                    #endregion

                    case 15:
                        #region RunBlock

                        if (PSAL[i].val1 == 0)
                        {
                            //assign route color
                            artlColor = ARTLColor.Block;

                            //manual offset of 2 yards forward
                            if (i == 0)
                            {
                                RoutePoints.Add(MoveDistDirToXY(12, 32, Offset, flipPSAL));
                            }
                        }
                        else
                        {
                            //assign route color
                            artlColor =
                                PSAL[i + 1].code != 255 ?
                                ARTLColor.DelayRoute :
                                artlColor = ARTLColor.Block;
                        }

                        break;

                    #endregion

                    case 16:
                        #region Kickoff?

                        artlColor = ARTLColor.Kickoff;
                        break;

                    #endregion

                    case 18:
                        #region LeadBlock

                        artlColor = ARTLColor.Block;
                        break;

                    #endregion

                    case 19:
                        #region Man Coverage

                        break;

                    #endregion

                    case 20:
                        #region Cloud flat, Hard Flat, Soft Squat 

                        if (PSAL[i].val1 == 9) RoutePoints.Add(new Point { X = (int)((533 * .167) - 266.5 - XY.X), Y = -50 - XY.Y });
                        else if (PSAL[i].val1 == 10) RoutePoints.Add(new Point { X = (int)((533 * .833) - 266.5 - XY.X), Y = -50 - XY.Y });

                        switch (PSAL[i].val2)
                        {
                            case 0:
                                artlColor = ARTLColor.CloudFlat;
                                break;
                            case 1:
                                artlColor = ARTLColor.HardFlat;
                                break;
                            case 2:
                                artlColor = ARTLColor.SoftSquat;
                                break;
                            default:
                                artlColor = ARTLColor.CloudFlat;
                                break;
                        }
                        break;

                    #endregion

                    case 21:
                        #region Mid Read, 3 Rec Hook, Hook Curl, Vert Hook  

                        //convert to offest
                        if (RoutePoints.Count > 0) Offset = RoutePoints[RoutePoints.Count - 1];
                        RoutePoints.Add(MoveDistDirToXY(20, PSAL[i].val2, Offset, flipPSAL));

                        switch (PSAL[i].val1)
                        {
                            case 0:
                                RoutePoints.Add(new Point { X = (int)((533 * .5) - 266.5 - XY.X), Y = -200 - XY.Y });
                                artlColor = ARTLColor.MidRead;
                                break;
                            case 1:
                                RoutePoints.Add(new Point { X = (int)((533 * .5) - 266.5 - XY.X), Y = -150 - XY.Y });
                                artlColor = ARTLColor.ThreeReceiverHook;
                                break;
                            case 2:
                                RoutePoints.Add(new Point { X = (int)((533 * .333) - 266.5 - XY.X), Y = -100 - XY.Y });
                                artlColor = ARTLColor.HookCurl;
                                break;
                            case 3:
                                RoutePoints.Add(new Point { X = (int)((533 * .667) - 266.5 - XY.X), Y = -100 - XY.Y });
                                artlColor = ARTLColor.HookCurl;
                                break;
                            case 4:
                                RoutePoints.Add(new Point { X = (int)((533 * .333) - 266.5 - XY.X), Y = -100 - XY.Y });
                                artlColor = ARTLColor.VertHook;
                                break;
                            case 5:
                                RoutePoints.Add(new Point { X = (int)((533 * .667) - 266.5 - XY.X), Y = -100 - XY.Y });
                                artlColor = ARTLColor.VertHook;
                                break;
                            default:
                                artlColor = ARTLColor.HookCurl;
                                break;
                        }
                        break;

                    #endregion

                    case 22:
                        #region Curl Flat, Seam Flat, Quarter Flat  

                        if (PSAL[i].val1 == 11) RoutePoints.Add(new Point { X = (int)((533 * .167) - 266.5 - XY.X), Y = -100 - XY.Y });
                        else if (PSAL[i].val1 == 12) RoutePoints.Add(new Point { X = (int)((533 * .833) - 266.5 - XY.X), Y = -100 - XY.Y });

                        switch (PSAL[i].val2)
                        {
                            case 0:
                                artlColor = ARTLColor.CurlFlat;
                                break;
                            case 1:
                                artlColor = ARTLColor.SeamFlat;
                                break;
                            case 2:
                                artlColor = ARTLColor.QuarterFlat;
                                break;
                            default:
                                artlColor = ARTLColor.SeamFlat;
                                break;
                        }
                        break;

                    #endregion

                    case 23:
                        #region Deep Zone  

                        switch (PSAL[i].val1)
                        {
                            case 0:
                                RoutePoints.Add(new Point { X = (int)((533 * .25) - 266.5 - XY.X), Y = -300 - XY.Y });
                                break;
                            case 1:
                                RoutePoints.Add(new Point { X = (int)((533 * .75) - 266.5 - XY.X), Y = -300 - XY.Y });
                                break;
                            case 2:
                                RoutePoints.Add(new Point { X = (int)((533 * .167) - 266.5 - XY.X), Y = -300 - XY.Y });
                                break;
                            case 3:
                                RoutePoints.Add(new Point { X = (int)((533 * .5) - 266.5 - XY.X), Y = -300 - XY.Y });
                                break;
                            case 4:
                                RoutePoints.Add(new Point { X = (int)((533 * .833) - 266.5 - XY.X), Y = -300 - XY.Y });
                                break;
                            case 5:
                                RoutePoints.Add(new Point { X = (int)((533 * .125) - 266.5 - XY.X), Y = -300 - XY.Y });
                                break;
                            case 6:
                                RoutePoints.Add(new Point { X = (int)((533 * .375) - 266.5 - XY.X), Y = -300 - XY.Y });
                                break;
                            case 7:
                                RoutePoints.Add(new Point { X = (int)((533 * .625) - 266.5 - XY.X), Y = -300 - XY.Y });
                                break;
                            case 8:
                                RoutePoints.Add(new Point { X = (int)((533 * .875) - 266.5 - XY.X), Y = -300 - XY.Y });
                                break;
                            default:
                                ;
                                break;
                        }

                        artlColor = ARTLColor.DeepZone;

                        break;

                    #endregion

                    case 24:
                        #region Pass Rush  

                        if (RoutePoints.Count > 0) Offset = RoutePoints[RoutePoints.Count - 1];
                        //else Offset = new Point(-266.5 - XY.Y, -400 - XY.Y);
                        RoutePoints.Add(MoveDistDirToXY(PSAL[i].val2, PSAL[i].val1, Offset, flipPSAL));
                        artlColor = ARTLColor.RushQB;

                        break;

                    #endregion

                    case 25:
                        #region Delay

                        break;

                    #endregion

                    case 26:
                        #region Initial Anim

                        if (RoutePoints.Count > 0) Offset = RoutePoints[RoutePoints.Count - 1];

                        if (PSAL[i].val1 == 1 || PSAL[i].val1 == 4 || PSAL[i].val1 == 5 || PSAL[i].val1 == 6)
                        {
                            RoutePoints.Add(MoveDistDirToXY(4, PSAL[i].val2, Offset, flipPSAL));
                        }
                        else if (PSAL[i].val1 == 25)
                        {
                            RoutePoints.Add(MoveDistDirToXY(32, PSAL[i].val2, Offset, flipPSAL));
                        }
                        else if (PSAL[i].val1 == 15)
                        {
                            RoutePoints.Add(MoveDistDirToXY(PSAL[i].val2, 96, Offset, flipPSAL));
                        }

                        //if (artlColor.Equals(ARTLColor.Undefined)) artlColor = ARTLColor.BaseRoute;
                        break;

                    #endregion

                    case 27:
                        #region Punt?

                        break;

                    #endregion

                    case 28:
                        #region FG Spot?

                        break;

                    #endregion

                    case 29:
                        #region FG Kick?

                        break;

                    #endregion

                    case 30:
                        #region Stop Clock?

                        break;

                    #endregion

                    case 31:
                        #region Kneel?

                        break;

                    #endregion

                    case 32:
                        #region Receive Pitch

                        if (RoutePoints.Count > 0) Offset = RoutePoints[RoutePoints.Count - 1];
                        RoutePoints.Add(MoveDistDirToXY(PSAL[i].val1, PSAL[i].val2, Offset, flipPSAL));
                        artlColor = ARTLColor.Run;
                        break;

                    #endregion

                    case 34:
                        #region QB Spy

                        artlColor = ARTLColor.QBSpy;

                        break;

                    #endregion

                    case 35:
                        #region Head Turn Run Route

                        if (RoutePoints.Count > 0) Offset = RoutePoints[RoutePoints.Count - 1];
                        RoutePoints.Add(MoveDistDirToXY(PSAL[i].val1, PSAL[i].val2, Offset, flipPSAL));
                        break;

                    #endregion

                    case 36:
                        #region Option Route

                        //Option Route Base
                        if (RoutePoints.Count > 0) Offset = RoutePoints[RoutePoints.Count - 1];
                        RoutePoints.Add(GetOptionOffset(PSAL[i].val1, Offset, flipPSAL));

                        //Option route 1
                        PathGeometry option1Geo = new PathGeometry();
                        PathFigure option1Figure = new PathFigure();
                        PathSegmentCollection Option1Segments = new PathSegmentCollection();
                        option1Figure.Segments = Option1Segments;
                        option1Geo.Figures.Add(option1Figure);
                        PointCollection Option1Points = new PointCollection();
                        PSALpath.Add(new Path());
                        PSALpath[PSALpath.Count - 1].Data = option1Geo;
                        option1Figure.StartPoint = RoutePoints.Count > 1 ? RoutePoints[RoutePoints.Count - 2] : RouteFigure.StartPoint;
                        PolyLineSegment option1_segment = new PolyLineSegment();
                        option1_segment.IsSmoothJoin = true;
                        Option1Segments.Add(option1_segment);
                        option1_segment.Points = Option1Points;
                        Option1Points.Add(GetOptionOffset(PSAL[i].val2, Offset, flipPSAL));

                        //Option route 2
                        if (PSAL[i].val3 != 255)
                        {
                            PathGeometry option2Geo = new PathGeometry();
                            PathFigure option2Figure = new PathFigure();
                            PathSegmentCollection Option2Segments = new PathSegmentCollection();
                            option2Figure.Segments = Option2Segments;
                            option2Geo.Figures.Add(option2Figure);
                            PointCollection Option2Points = new PointCollection();
                            PSALpath.Add(new Path());
                            PSALpath[PSALpath.Count - 1].Data = option2Geo;
                            option2Figure.StartPoint = option1Figure.StartPoint;
                            PolyLineSegment option2_segment = new PolyLineSegment();
                            option2_segment.IsSmoothJoin = true;
                            Option2Segments.Add(option2_segment);
                            option2_segment.Points = Option2Points;
                            Option2Points.Add(GetOptionOffset(PSAL[i].val3, Offset, flipPSAL));
                        }

                        break;

                    #endregion

                    case 37:
                        #region Option Route Extra Info

                        break;

                    #endregion

                    case 38:
                        #region Handoff Turn?

                        artlColor = ARTLColor.QBHandoff;
                        break;

                    #endregion

                    case 39:
                        #region Handoff Give?

                        artlColor = ARTLColor.QBHandoff;
                        break;

                    #endregion

                    case 40:
                        #region Option Run?

                        artlColor = ARTLColor.Run;
                        break;

                    #endregion

                    case 41:
                        #region Rush QB

                        if (SRFT != null)
                        {
                            switch (SRFT.GAPS)
                            {
                                case 1:
                                    RoutePoints.Add(new Point { X = (16.5 * .5) - XY.X, Y = 15 - XY.Y });
                                    break;
                                case 2:
                                    RoutePoints.Add(new Point { X = (-16.5 * .5) - XY.X, Y = 15 - XY.Y });
                                    break;
                                case 3:
                                    RoutePoints.Add(new Point { X = -XY.X, Y = 15 - XY.Y });
                                    break;
                                case 4:
                                    RoutePoints.Add(new Point { X = (16.5 * 1.5) - XY.X, Y = 15 - XY.Y });
                                    break;
                                case 5:
                                    RoutePoints.Add(new Point { X = 16.5 - XY.X, Y = 15 - XY.Y });
                                    break;
                                case 8:
                                    RoutePoints.Add(new Point { X = (-16.5 * 1.5) - XY.X, Y = 15 - XY.Y });
                                    break;
                                case 10:
                                    RoutePoints.Add(new Point { X = 16.5 - XY.X, Y = 15 - XY.Y });
                                    break;
                                case 16:
                                    RoutePoints.Add(new Point { X = (16.5 * 2.5) - XY.X, Y = 15 - XY.Y });
                                    break;
                                case 20:
                                    RoutePoints.Add(new Point { X = (16.5 * 2) - XY.X, Y = 15 - XY.Y });
                                    break;
                                case 32:
                                    RoutePoints.Add(new Point { X = (-16.5 * 2.5) - XY.X, Y = 15 - XY.Y });
                                    break;
                                case 40:
                                    RoutePoints.Add(new Point { X = (-16.5 * 2) - XY.X, Y = 15 - XY.Y });
                                    break;
                                case 64:
                                    RoutePoints.Add(new Point { X = (16.5 * 3.5) - XY.X, Y = 15 - XY.Y });
                                    break;
                                case 128:
                                    RoutePoints.Add(new Point { X = (-16.5 * 3.5) - XY.X, Y = 15 - XY.Y });
                                    break;
                                case 256:
                                    RoutePoints.Add(new Point { X = (16.5 * 4.5) - XY.X, Y = 15 - XY.Y });
                                    break;
                                case 512:
                                    RoutePoints.Add(new Point { X = (-16.5 * 4.5) - XY.X, Y = 15 - XY.Y });
                                    break;
                                default:
                                    break;
                            }

                            if (artlColor.Equals(ARTLColor.Undefined)) artlColor = ARTLColor.RushQB;
                        }
                        else
                        {
                            if (RoutePoints.Count > 0) Offset = RoutePoints[RoutePoints.Count - 1];
                            RoutePoints.Add(MoveDistDirToXY(PSAL[i].val1, PSAL[i].val2, Offset, flipPSAL));
                            artlColor = ARTLColor.Run;
                        }

                        break;

                    #endregion

                    case 42:
                        #region Hand Off Fake?

                        artlColor = ARTLColor.QBScramble;
                        break;

                    #endregion

                    case 43:
                        #region Option Follow

                        artlColor = ARTLColor.Run;
                        break;

                    #endregion

                    case 44:
                        #region Wedge Block

                        artlColor = ARTLColor.Block;

                        break;

                    #endregion

                    case 45:
                        #region Auto Motion Offense

                        if (flipPSAL)
                        {
                            RoutePoints.Add(
                                new Point
                                {
                                    X = ((PSAL[i].val1 / 5.6667) - SETG.fx__) * 10 * -2,
                                    Y = (Math.Abs(PSAL[i].val2 / 5.6667) + SETG.y___) * 10
                                });
                        }
                        else
                        {
                            RoutePoints.Add(
                                new Point
                                {
                                    X = ((PSAL[i].val1 / 5.6667) - SETG.x___) * 10,
                                    Y = (Math.Abs(PSAL[i].val2 / 5.6667) + SETG.fy__) * 10
                                });
                        }
                        artlColor = ARTLColor.MotionRoute;
                        break;

                    #endregion

                    case 46:
                        #region Auto Motion Snap

                        break;

                    #endregion

                    case 47:
                        #region Auto Motion Defense

                        if (flipPSAL)
                        {
                            RoutePoints.Add(
                                new Point
                                {
                                    X = (PSAL[i].val1 * -3.5294) - XY.X,
                                    Y = (PSAL[i].val2 * -1.7647) - XY.Y
                                });
                        }
                        else
                        {
                            RoutePoints.Add(
                                new Point
                                {
                                    X = (PSAL[i].val1 * 1.7647) - XY.X,
                                    Y = (PSAL[i].val2 * -1.7647) - XY.Y
                                });
                        }
                        artlColor = ARTLColor.MotionRoute;
                        break;

                    #endregion

                    case 48:
                        #region Player offset

                        //val1 to X = 9/51 = 1.7647
                        //val2 to Y = .8/3 = 2.6667
                        XY = new Point(PSAL[i].val1 * 1.7647, PSAL[i].val2 * -2.6667);
                        //if (flipPSAL) RoutePoints[RoutePoints.Count - 1].Offset(RoutePoints[RoutePoints.Count - 1].X * -2, RoutePoints[RoutePoints.Count - 1].Y);

                        break;

                    #endregion

                    case 57:
                        #region Animation Defense

                        break;

                    #endregion

                    case 58:
                        #region Animation Offense

                        break;

                    #endregion

                    case 255:
                        #region End of Route

                        break;

                        #endregion
                }
            }

            return PSALpath;
        }

        public static Point MoveDistDirToXY(int dist, int dir, Point Offset, bool flipPSAL)
        {
            double angle = Math.PI * (dir / Madden.TeamPlaybook.PSAL.AngleRatio) / 180.0;
            double sinAngle = Math.Sin(angle);
            double cosAngle = Math.Cos(angle);
            Point XY = new Point();

            if (dist > 128)
            {
                dist = (int)(dist * .5);
            }

            XY.X = (int)(cosAngle * (dist / .8));
            XY.Y = (int)(sinAngle * (dist / .8)) * -1;

            XY.Offset(Offset.X, Offset.Y);

            if (flipPSAL) XY.Offset(XY.X * -2, Offset.Y);

            return XY;
        }

        public static Point GetOptionOffset(int code, Point Offset, bool flipPSAL)
        {
            if (code == 0)     //Curl left
            {
                return MoveDistDirToXY(16, (int)(225 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL);
            }

            if (code == 1)    //Curl right
            {
                return MoveDistDirToXY(16, (int)(-45 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL);
            }

            if (code == 2)    //Post right
            {
                return MoveDistDirToXY(90, (int)(45 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL);
            }

            if (code == 3)    //Corner left
            {
                return MoveDistDirToXY(90, (int)(135 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL);
            }

            if (code == 5)     //Slant right
            {
                return MoveDistDirToXY(90, (int)(33 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL);
            }

            if (code == 6)    //Fade/Streak left
            {
                return MoveDistDirToXY(90, (int)(93 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL);
            }

            if (code == 7)    //Slant left
            {
                return MoveDistDirToXY(90, (int)(147 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL);
            }

            if (code == 8)    //Fade/Streak right
            {
                return MoveDistDirToXY(90, (int)(87 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL);
            }

            if (code == 9)     //In/Out right
            {
                return MoveDistDirToXY(90, (int)(0 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL);
            }

            if (code == 10)    //In/Out left
            {
                return MoveDistDirToXY(90, (int)(180 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL);
            }

            if (code == 11)   //Fade left
            {
                return MoveDistDirToXY(90, (int)(93 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL);
            }

            if (code == 12)    //Hitch left
            {
                return MoveDistDirToXY(16, (int)(225 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL);
            }

            if (code == 13)    //Hitch right
            {
                return MoveDistDirToXY(16, (int)(-45 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL);
            }

            if (code == 15)   //180 Partial
            {
                return MoveDistDirToXY(16, (int)(270 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL);
            }

            if (code == 16)   //180 Partial
            {
                return MoveDistDirToXY(16, (int)(270 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL);
            }

            if (code == 17)   //Drag right
            {
                return MoveDistDirToXY(90, (int)(3 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL);
            }

            if (code == 18)   //Drag left
            {
                return MoveDistDirToXY(90, (int)(177 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL);
            }

            if (code == 19)   //Hitch right
            {
                return MoveDistDirToXY(16, (int)(-45 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL);
            }

            if (code == 20)   //Hitch left
            {
                return MoveDistDirToXY(16, (int)(225 * Madden.TeamPlaybook.PSAL.AngleRatio), Offset, flipPSAL);
            }

            return new Point { X = 0, Y = 0 };
        }

        public static Point[] XYtoPoint(List<Point> xy)
        {
            Point[] points = new Point[xy.Count];

            for (int i = 0; i < xy.Count; i++)
            {
                points[i].X = xy[i].X;
                points[i].Y = xy[i].Y;
            }

            return points;
        }

        #region INotifyPropertyChanged Members

        [field: NonSerializedAttribute()]
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            if (this.PropertyChanged != null)
            {
                this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
                GetPSAL();
            }
        }

        #endregion // INotifyPropertyChanged Members
    }
}