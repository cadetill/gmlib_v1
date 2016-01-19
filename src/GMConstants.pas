{
GMConstants

  ES: unidad con constantes
  EN: unit with constants

=========================================================================
History:

ver 0.1.9
  ES:
    nuevo: documentación
  EN:
    new: documentation

ver 0.1:
  ES: primera versión
  EN: first version
=========================================================================
IMPORTANTE PROGRAMADORES: Por favor, si tienes comentarios, mejoras,
  ampliaciones, errores y/o cualquier otro tipo de sugerencia, envíame un correo a:
  gmlib@cadetill.com

IMPORTANT PROGRAMMERS: please, if you have comments, improvements, enlargements,
  errors and/or any another type of suggestion, please send me a mail to:
  gmlib@cadetill.com
=========================================================================

Copyright (©) 2011, by Xavier Martinez (cadetill)

@author Xavier Martinez (cadetill)
@web  http://www.cadetill.com
}
{*------------------------------------------------------------------------------
  The GMConstants unit includes constants ans sets.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit GMConstants incluye constantes y conjuntos.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
unit GMConstants;

interface

const
  { ****************************************************************************
  ******  Version
  **************************************************************************** }
  GMLIB_Version = '[1.5.3 Final]';
  GMLIB_VerText = '1.5.3 Final';

  { ****************************************************************************
  ******  Editors
  **************************************************************************** }
  AboutGMLibTxt = 'About GMLib';
  MEditor = 'Marker Editor';

  { ****************************************************************************
  ******  Markers
  **************************************************************************** }
  StrColoredMarker = 'http://chart.apis.google.com/chart?cht=mm&chs=%dx%d&chco=%s,%s,%s&ext=.png';

  { ****************************************************************************
  ******  General constants
  **************************************************************************** }
  RES_MAPA_CODE = 'RES_MAPCODE';
  C_API_KEY: string = 'API_KEY';

  { ****************************************************************************
  ******  Form Names
  **************************************************************************** }
  // data forms
  MapForm = 'mapdata';
  LatLngBoundsForm = 'latlngboundsdata';
  ErrorForm = 'errordata';
  PolylineForm = 'polylinedata';
  RectangleForm = 'rectangledata';
  CircleForm = 'circledata';
  DirectionsForm = 'directionsdata';
  GeocoderForm = 'geocoderdata';
  ElevationsForm = 'elevationsdata';
  GeometryForm = 'geometrydata';
  MaxZoomdForm = 'maxzoomdata';
  // events forms
  EventsMapForm = 'eventsMap';
  EventsInfoWinForm = 'eventsInfoWin';
  EventsMarkerForm = 'eventsMarker';
  EventsPolylineForm = 'eventsPolyline';
  EventsRectangleForm = 'eventsRectangle';
  EventsCircleForm = 'eventsCircle';
  EventsDirectionForm = 'eventsDirection';
  EventsGroundOverlay = 'eventsGO';

  { ****************************************************************************
  ******  Form Fields Names
  **************************************************************************** }
  // Properties LatLngBounds Form
  LatLngBoundsFormSWLat = 'swLat';
  LatLngBoundsFormSWLng = 'swLng';
  LatLngBoundsFormNELat = 'neLat';
  LatLngBoundsFormNELng = 'neLng';
  LatLngBoundsFormContains = 'contains';

  // Properties Map Form
  MapFormMapIsNull = 'mapisnull';
  MapFormLat = 'lat';
  MapFormLng = 'lng';
  MapFormMapTypeId = 'maptype';
  MapFormZoom = 'zoom';

  // Properties Polyline Form
  PolylineFormPath = 'path';
  PolylineFormLat = 'lat';
  PolylineFormLng = 'lng';

  // Properties Rectangle Form
  RectangleFormLat = 'lat';
  RectangleFormLng = 'lng';

  // Properties Circle Form
  CircleFormNELat = 'NELat';
  CircleFormNELng = 'NELng';
  CircleFormSWLat = 'SWLat';
  CircleFormSWLng = 'SWLng';

  // Properties Directions Form
  DirectionsFormXML = 'xml';
  DirectionsFormResponse = 'response';

  // Properties Geocoder Form
  GeocoderFormXML = 'xml';
  GeocoderFormResponse = 'response';

  // Properties Elevations Form
  ElevationsFormStatus = 'status';
  ElevationsFormElevations = 'elevations';
  ElevationsFormResponse = 'response';

  // Properties Geometry Form
  GeometryFormEncodedPath = 'encodedPath';
  GeometryFormDecodedPath = 'decodedPath';
  GeometryFormContainsLocation = 'cntLoc';
  GeometryFormIsLocationOnEdge = 'isLoc';
  GeometryFormComputeArea = 'comArea';
  GeometryFormComputeDist = 'comDist';
  GeometryFormComputeHea = 'comHea';
  GeometryFormComputeLength = 'comLength';
  GeometryFormComputeOffLat = 'comOffLat';
  GeometryFormComputeOffLng = 'comOffLng';
  GeometryFormComputeSigA = 'comSigA';
  GeometryFormInterLat = 'interLat';
  GeometryFormInterLng = 'interLng';

  // Properties Error Form
  ErrorFormErrorCode = 'errorCode';

  // Properties Error Form
  MaxZoomdFormStatus = 'status';
  MaxZoomdFormMaxZoom = 'maxzoom';
  MaxZoomdFormResponse = 'response';

  // Events Form
      // General
  EventsFormEventFired = 'eventfired';
  EventsFormLinkCompId = 'linkCompId';
  EventsFormLinkCompZIndex = 'linkCompZIndex';
  EventsFormLat = 'lat';
  EventsFormLng = 'lng';
  EventsFormSWLat = 'swLat';
  EventsFormSWLng = 'swLng';
  EventsFormNELat = 'neLat';
  EventsFormNELng = 'neLng';
      // Events Names
  EventsFormClick = 'click';
  EventsFormDblClick = 'dblclick';
  EventsFormDrag = 'drag';
  EventsFormDragEnd = 'dragEnd';
  EventsFormDragStart = 'dragStart';
  EventsFormMouseMove = 'mouseMove';
  EventsFormMouseOver = 'mouseOver';
  EventsFormMouseOut = 'mouseOut';
  EventsFormMouseDown = 'mouseDown';
  EventsFormMouseUp = 'mouseUp';
  EventsFormRightClick = 'rightClick';
  EventsFormBoundsChange = 'boundsChange';
  EventsFormCenterChange = 'centerChange';
      // Map
  EventsFormMapTypeIdChanged = 'mapTypeId_changed';
  EventsFormTilesLoaded = 'tilesLoaded';
  EventsFormZoomChanged = 'zoomChanged';
  EventsFormMapTypeId = 'mapTypeId';
  EventsFormZoom = 'zoom';
  EventsFormWeatherClick = 'weatherClick';
  EventsFormWeatherLat = 'weatherLat';
  EventsFormWeatherLng = 'weatherLng';
  EventsFormWeatherFeature = 'weatherFeature';
  EventsFormPanoClick = 'panoClick';
  EventsFormPanoLat = 'panoLat';
  EventsFormPanoLng = 'panoLng';
  EventsFormPanoAuthor = 'panoAuthor';
  EventsFormPanoPhotoId = 'panoPhotoId';
  EventsFormPanoTitle = 'panoTitle';
  EventsFormPanoUrl = 'panoUrl';
  EventsFormPanoUserId = 'panoUserId';
  EventsFormX = 'x';
  EventsFormY = 'y';
      // Marker
  EventsMarkerAnimChng = 'marker_animation_changed';
  EventsMarkerAnim = 'marker_animation';
      // InfoWindow
  EventsFormInfoWinCloseClick = 'infoWinCloseClick';
      // polyline
      // rectangle
      // circle
  EventsFormCircleRadiusChange = 'radiusChange';
  EventsFormCircleRadius = 'radius';
      // GroundOverlay
      // direction
  EventsFormXML = 'xml';
  EventsFormDirectionsChanged = 'directions_changed';

  { ****************************************************************************
  ******  XML Weather constants
  **************************************************************************** }
  LBL_WEATHERFEATURE = 'WeatherFeature';
  LBL_W_LOCATION = 'location';
  LBL_W_TEMPERATUREUNIT = 'temperatureUnit';
  LBL_W_WINDSPEEDUNIT = 'windSpeedUnit';
  LBL_W_CURRENT = 'current';
  LBL_W_DAY = 'day';
  LBL_W_DESCRIPTION = 'description';
  LBL_W_HIGH = 'high';
  LBL_W_HUMIDITY = 'humidity';
  LBL_W_LOW = 'low';
  LBL_W_SHORTDAY = 'shortDay';
  LBL_W_TEMPERATURE = 'temperature';
  LBL_W_WINDDIRECTION = 'windDirection';
  LBL_W_WINDSPEED = 'windSpeed';
  LBL_W_FORECAST = 'forecast';

  { ****************************************************************************
  ******  Geocoding constants
  **************************************************************************** }
  LBL_GEOCODERESPONSE = 'GeocodeResponse';
  LBL_STATUS = 'status';
  LBL_RESULT = 'result';
  LBL_TYPE = 'type';
  LBL_FORMATTED_ADDRESS = 'formatted_address';
  LBL_ADDRCOMPONENT = 'address_component';
  LBL_GEOMETRY = 'geometry';
  LBL_LOCATION = 'location';
  LBL_LAT = 'lat';
  LBL_LNG = 'lng';
  LBL_LOCATION_TYPE = 'location_type';
  LBL_VIEWPORT = 'viewport';
  LBL_BOUNDS = 'bounds';
  LBL_SOUTHWEST = 'southwest';
  LBL_NORTHEAST = 'northeast';
  LBL_LONG_NAME = 'long_name';
  LBL_SHORT_NAME = 'short_name';

  { ****************************************************************************
  ******  XML Directions constants
  **************************************************************************** }
  LBL_D_DIRECTIONSRESPONSE = 'DirectionsResponse';
  LBL_D_STATUS = 'status';
  LBL_D_ROUTE = 'route';
  LBL_D_SUMMARY = 'summary';
  LBL_D_COPYRIGHTS = 'copyrights';
  LBL_D_BOUNDS = 'bounds';
  LBL_D_SOUTHWEST = 'southwest';
  LBL_D_NORTHEAST = 'northeast';
  LBL_D_LAT = 'lat';
  LBL_D_LNG = 'lng';
  LBL_D_WARNING = 'warning';
  LBL_D_WAYPOINTORDER = 'waypoint_order';
  LBL_D_OVERVIEWPATH = 'overview_path';
  LBL_D_LEG = 'leg';
  LBL_D_ARRIVALTIME = 'arrival_time';
  LBL_D_TEXT = 'text';
  LBL_D_VALUE = 'value';
  LBL_D_DEPARTURETIME = 'departure_time';
  LBL_D_DISTANCE = 'distance';
  LBL_D_DURATION = 'duration';
  LBL_D_ENDADDRESS = 'end_address';
  LBL_D_STARTADDRESS = 'start_address';
  LBL_D_ENDLOCATION = 'end_location';
  LBL_D_STARTLOCATION = 'start_location';
  LBL_D_VIAWAYPOINTS = 'via_waypoints';
  LBL_D_STEP = 'step';
  LBL_D_INSTRUCTIONS = 'instructions';
  LBL_D_PATH = 'path';
  LBL_D_STEPS = 'steps';
  LBL_D_TRAVELMODE = 'travel_mode';
  LBL_D_TRANSIT = 'transit';
  LBL_D_ARRIVALSTOP = 'arrival_stop';
  LBL_D_LOCATION = 'location';
  LBL_D_NAME = 'name';
  LBL_D_TIMEZONE = 'time_zone';
  LBL_D_DEPARTURESTOP = 'departure_stop';
  LBL_D_HEADSIGN = 'headsign';
  LBL_D_HEADWAY = 'headway';
  LBL_D_NUMSTOPS = 'num_stops';
  LBL_D_LINE = 'line';
  LBL_D_COLOR = 'color';
  LBL_D_ICON = 'icon';
  LBL_D_SHORTNAME = 'short_name';
  LBL_D_TEXTCOLOR = 'text_color';
  LBL_D_URL = 'url';
  LBL_D_VEHICLE = 'vehicle';
  LBL_D_LOCALICON = 'local_icon';
  LBL_D_TYPE = 'type';
  LBL_D_AGENCIES = 'agencies';
  LBL_D_PHONE = 'phone';

type
  TLang = (Espanol, English, French, PortuguesBR, Danish, German, Russian, Hungarian, Italian);

  TEventType = (etMarkerClick, etMarkerDblClick, etMarkerDrag, etMarkerDragEnd, etMarkerDragStart,
              etMarkerMouseDown, etMarkerMouseOut, etMarkerMouseOver, etMarkerMouseUp,
              etMarkerRightClick,
              etInfoWinCloseClick, etInfoWinCloseOBO, etInfoWinDisableAP,
              etInfoWinHTMLContent, etInfoWinMaxWidth, etPixelOffset,
              etPolylineClick, etPolylineDblClick, etPolylineMouseDown, etPolylineMouseMove,
              etPolylineMouseOut, etPolylineMouseOver, etPolylineMouseUp, etPolylineRightClick,
              etRectangleClick, etRectangleDblClick, etRectangleMouseDown, etRectangleMouseMove,
              etRectangleMouseOut, etRectangleMouseOver, etRectangleMouseUp, etRectangleRightClick,
              etRectangleBoundsChange,
              etCircleClick, etCircleDblClick, etCircleMouseDown, etCircleMouseMove,
              etCircleMouseOut, etCircleMouseOver, etCircleMouseUp, etCircleRightClick,
              etCircleCenterChange, etCircleRadiusChange,
              etGOClick, etGODblClick,
              etDirectionsChanged
              );

  { ****************************************************************************
  https://developers.google.com/maps/documentation/javascript/reference?hl=en#MapTypeId
  **************************************************************************** }
  TMapTypeId = (mtHYBRID, mtROADMAP, mtSATELLITE, mtTERRAIN, mtOSM);
  TMapTypeIds = set of TMapTypeId;
  { ****************************************************************************
  https://developers.google.com/maps/documentation/javascript/reference?hl=en#MapTypeControlStyle
  **************************************************************************** }
  TMapTypeControlStyle = (mtcDEFAULT, mtcDROPDOWN_MENU, mtcHORIZONTAL_BAR);
  { ****************************************************************************
  https://developers.google.com/maps/documentation/javascript/reference?hl=en#ScaleControlStyle
  **************************************************************************** }
  TScaleControlStyle = (scDEFAULT);
  { ****************************************************************************
  https://developers.google.com/maps/documentation/javascript/reference?hl=en#ZoomControlStyle
  **************************************************************************** }
  TZoomControlStyle = (zcDEFAULT, zcLARGE, zcSMALL);
  { ****************************************************************************
  https://developers.google.com/maps/documentation/javascript/reference?hl=en#ControlPosition
  **************************************************************************** }
  TControlPosition = (cpBOTTOM_CENTER, cpBOTTOM_LEFT, cpBOTTOM_RIGHT,
                      cpLEFT_BOTTOM, cpLEFT_CENTER, cpLEFT_TOP,
                      cpRIGHT_BOTTOM, cpRIGHT_CENTER, cpRIGHT_TOP,
                      cpTOP_CENTER, cpTOP_LEFT, cpTOP_RIGHT);
  { ****************************************************************************
  https://developers.google.com/maps/documentation/javascript/reference?hl=en#Animation
  **************************************************************************** }
  TAnimation = (anBOUNCE, anDROP);
  { ****************************************************************************
  https://developers.google.com/maps/documentation/javascript/reference#GeocoderStatus
  **************************************************************************** }
  TGeocoderStatus = (gsERROR, gsINVALID_REQUEST, gsOK, gsOVER_QUERY_LIMIT, gsREQUEST_DENIED,
          gsUNKNOWN_ERROR, gsZERO_RESULTS, gsWithoutState);
  { ****************************************************************************
  https://developers.google.com/maps/documentation/javascript/reference?hl=en#GeocoderLocationType
  **************************************************************************** }
  TGeocoderLocationType = (gltAPPROXIMATE, gltGEOMETRIC_CENTER, gltRANGE_INTERPOLATED,
          gltROOFTOP, gltNOTHING);
  { ****************************************************************************
  https://spreadsheets.google.com/pub?key=p9pdwsai2hDMsLkXsoM05KQ&gid=1
  **************************************************************************** }
  TLangCode = (lc_NOT_DEFINED, lcARABIC, lcBASQUE, lcBENGALI, lcBULGARIAN, lcCATALAN,
          lcCHINESE_SIMPLIFIED, lcCHINESE_TRADITIONAL, lcCROATIAN, lcCZECH, lcDANISH,
          lcDUTCH, lcENGLISH, lcENGLISH_AUSTRALIAN, lcENGLISH_GREAT_BRITAIN, lcFARSI,
          lcFILIPINO, lcFINNISH, lcFRENCH, lcGALICIAN, lcGERMAN, lcGREEK, lcGUJARATI,
          lcHEBREW, lcHINDI, lcHUNGARIAN, lcINDONESIAN, lcITALIAN, lcJAPANESE, lcKANNADA,
          lcKOREAN, lcLATVIAN, lcLITHUANIAN, lcMALAYALAM, lcMARATHI, lcNORWEGIAN,
          lcPOLISH, lcPORTUGUESE, lcPORTUGUESE_BRAZIL, lcPORTUGUESE_PORTUGAL, lcROMANIAN,
          lcRUSSIAN, lcSERBIAN, lcSLOVAK, lcSLOVENIAN, lcSPANISH, lcSWEDISH, lcTAGALOG,
          lcTAMIL, lcTELUGU, lcTHAI, lcTURKISH, lcUKRAINIAN, lcVIETNAMESE);
  { ****************************************************************************
  http://en.wikipedia.org/wiki/List_of_Internet_top-level_domains#Country_code_top-level_domains
  **************************************************************************** }
  TRegion = (r_NO_REGION, rAFGHANISTAN, rALAND, rALBANIA, rALGERIA, rAMERICAN_SAMOA, rANDORRA,
          rANGOLA, rANGUILLA, rANTARCTICA, rANTIGUA_AND_BARBUDA, rARGENTINA, rARMENIA, rARUBA,
          rASCENSION_ISLAND, rAUSTRALIA, rAUSTRIA, rAZERBAIJAN, rBAHAMAS, rBAHRAIN, rBANGLADESH,
          rBARBADOS, rBELARUS, rBELGIUM, rBELIZE, rBENIN, rBERMUDA, rBHUTAN, rBOLIVIA,
          rBOSNIA_AND_HERZEGOVINA, rBOTSWANA, rBRAZIL, rBRITISH_INDIAN_OCEAN_TERRITORY,
          rBRITISH_VIRGIN_ISLANDS, rBRUNEI, rBULGARIA, rBURKINA_FASO, rBURUNDI, rCAMBODIA,
          rCAMEROON, rCANADA, rCAPE_VERDE, rCAYMAN_ISLANDS, rCENTRAL_AFRICAN_REPUBLIC, rCHAD,
          rCHILE, rCHRISTMAS_ISLAND, rCOCOS_KEELING_ISLANDS, rCOLOMBIA, rCOMOROS, rCOOK_ISLANDS,
          rCOSTA_RICA, rCOTE_D_IVOIRE, rCROATIA, rCUBA, rCYPRUS, rCZECH_REPUBLIC,
          rDEMOCRATIC_PEOPLE_S_REPUBLIC_OF_KOREA, rDEMOCRATIC_REPUBLIC_OF_THE_CONGO, rDENMARK,
          rDJIBOUTI, rDOMINICA, rDOMINICAN_REPUBLIC, rEAST_TIMOR, rECUADOR, rEGYPT, rEL_SALVADOR,
          rEQUATORIAL_GUINEA, rERITREA, rESTONIA, rETHIOPIA, rEUROPEAN_UNION, rFALKLAND_ISLANDS,
          rFAROE_ISLANDS, rFEDERATED_STATES_OF_MICRONESIA, rFIJI, rFINLAND, rFRANCE,
          rFRENCH_GUIANA, rFRENCH_POLYNESIA, rFRENCH_SOUTHERN_AND_ANTARCTIC_LANDS, rGABON,
          rGEORGIA, rGERMANY, rGHANA, rGIBRALTAR, rGREECE, rGREENLAND, rGRENADA, rGUADELOUPE,
          rGUAM, rGUATEMALA, rGUERNSEY, rGUINEA, rGUINEA_BISSAU, rGUYANA, rHAITI,
          rHEARD_ISLAND_AND_MCDONALD_ISLANDS, rHONDURAS, rHONG_KONG, rHUNGARY, rICELAND,
          rINDIA, rINDONESIA, rIRAN, rIRAQ, rISLE_OF_MAN, rISRAEL, rITALY, rJAMAICA, rJAPAN,
          rJERSEY, rJORDAN, rKAZAKHSTAN, rKENYA, rKIRIBATI, rKUWAIT, rKYRGYZSTAN, rLAOS, rLATVIA,
          rLEBANON, rLESOTHO, rLIBERIA, rLIBYA, rLIECHTENSTEIN, rLITHUANIA, rLUXEMBOURG, rMACAU,
          rMACEDONIA, rMADAGASCAR, rMALAWI, rMALAYSIA, rMALDIVES, rMALI, rMALTA, rMARSHALL_ISLANDS,
          rMARTINIQUE, rMAURITANIA, rMAURITIUS, rMAYOTTE, rMEXICO, rMOLDOVA, rMONACO, rMONGOLIA,
          rMONTENEGRO, rMONTSERRAT, rMOROCCO, rMOZAMBIQUE, rMYANMAR, rNAMIBIA, rNAURU, rNEPAL,
          rNETHERLANDS, rNETHERLANDS_ANTILLES, rNEW_CALEDONIA, rNEW_ZEALAND, rNICARAGUA, rNIGER,
          rNIGERIA, rNIUE, rNORFOLK_ISLAND, rNORTHERN_MARIANA_ISLANDS, rNORWAY, rOMAN, rPAKISTAN,
          rPALAU, rPALESTINIAN_TERRITORIES, rPANAMA, rPAPUA_NEW_GUINEA, rPARAGUAY,
          rPEOPLE_S_REPUBLIC_OF_CHINA, rPERU, rPHILIPPINES, rPITCAIRN_ISLANDS, rPOLAND, rPORTUGAL,
          rPUERTO_RICO, rQATAR, rREPUBLIC_OF_IRELAND_AND_NORTHERN_IRELAND, rREPUBLIC_OF_KOREA,
          rREPUBLIC_OF_THE_CONGO, rREUNION, rROMANIA, rRUSSIA, rRWANDA, rSAINT_HELENA,
          rSAINT_KITTS_AND_NEVIS, rSAINT_LUCIA, rSAINT_VINCENT_AND_THE_GRENADINES,
          rSAINT_PIERRE_AND_MIQUELON, rSAMOA, rSAN_MARINO, rSAO_TOME_AND_PRINCIPE, rSAUDI_ARABIA,
          rSENEGAL, rSERBIA, rSEYCHELLES, rSIERRA_LEONE, rSINGAPORE, rSLOVAKIA, rSLOVENIA,
          rSOLOMON_ISLANDS, rSOMALIA, rSOUTH_AFRICA, rSOUTH_GEORGIA_AND_THE_SOUTH_SANDWICH_ISLANDS,
          rSOUTH_SUDAN, rSPAIN, rSRI_LANKA, rSUDAN, rSURINAME, rSWAZILAND, rSWEDEN, rSWITZERLAND,
          rSYRIA, rTAIWAN, rTAJIKISTAN, rTANZANIA, rTHAILAND, rTHE_GAMBIA, rTOGO, rTOKELAU, rTONGA,
          rTRINIDAD_AND_TOBAGO, rTUNISIA, rTURKEY, rTURKMENISTAN, rTURKS_AND_CAICOS_ISLANDS,
          rTUVALU, rUGANDA, rUKRAINE, rUNITED_ARAB_EMIRATES, rUNITED_KINGDOM,
          rUNITED_STATES_OF_AMERICA, rUNITED_STATES_VIRGIN_ISLANDS, rURUGUAY, rUZBEKISTAN,
          rVANUATU, rVATICAN_CITY, rVENEZUELA, rVIETNAM, rWALLIS_AND_FUTUNA, rWESTERN_SAHARA,
          rYEMEN, rZAMBIA, rZIMBABWE);
  { ****************************************************************************
  https://developers.google.com/maps/documentation/javascript/reference#TravelMode
  **************************************************************************** }
  TTravelMode = (tmBICYCLING, tmDRIVING, tmTRANSIT, tmWALKING);
  { ****************************************************************************
  https://developers.google.com/maps/documentation/javascript/reference#UnitSystem
  **************************************************************************** }
  TUnitSystem = (usIMPERIAL, usMETRIC);
  { ****************************************************************************
  https://developers.google.com/maps/documentation/javascript/directions#TransitInformation
  **************************************************************************** }
  TVehicleType = (vtRAIL, vtMETRO_RAIL, vtSUBWAY, vtTRAM, vtMONORAIL, vtHEAVY_RAIL,
          vtCOMMUTER_TRAIN, vtHIGH_SPEED_TRAIN, vtBUS, vtINTERCITY_BUS, vtTROLLEYBUS,
          vtSHARE_TAXI, vtFERRY, vtCABLE_CAR, vtGONDOLA_LIFT, vtFUNICULAR, vtOTHER);
  { ****************************************************************************
  https://developers.google.com/maps/documentation/javascript/reference#DirectionsStatus
  **************************************************************************** }
  TDirectionsStatus = (dsINVALID_REQUEST, dsMAX_WAYPOINTS_EXCEEDED, dsNOT_FOUND,
          dsOK, dsOVER_QUERY_LIMIT, dsREQUEST_DENIED, dsUNKNOWN_ERROR, dsZERO_RESULTS);
  { ****************************************************************************
  https://developers.google.com/maps/documentation/javascript/reference#LabelColor
  **************************************************************************** }
  TLabelColor = (lcBLACK, lcWHITE);
  { ****************************************************************************
  https://developers.google.com/maps/documentation/javascript/reference#TemperatureUnit
  **************************************************************************** }
  TTemperatureUnit = (tuCELSIUS, tuFAHRENHEIT);
  { ****************************************************************************
  https://developers.google.com/maps/documentation/javascript/reference#WindSpeedUnit
  **************************************************************************** }
  TWindSpeedUnit = (wsKILOMETERS_PER_HOUR, wsMETERS_PER_SECOND, wsMILES_PER_HOUR);
  { ****************************************************************************
  https://developers.google.com/maps/documentation/javascript/reference?hl=en#SymbolPath
  **************************************************************************** }
  TSymbolPath = (spNONE, spBACKWARD_CLOSED_ARROW, spBACKWARD_OPEN_ARROW, spCIRCLE,
          spFORWARD_CLOSED_ARROW, spFORWARD_OPEN_ARROW, spDASHEDLINE);
  { ****************************************************************************
  internal set
  **************************************************************************** }
  TMeasure = (mPixels, mPercentage);
  { ****************************************************************************
  internal set
  **************************************************************************** }
  TMarkerType = (mtStandard, mtColored, mtStyledMarker);
  { ****************************************************************************
  internal set
  **************************************************************************** }
  TStyledIcon = (siMarker, siBubble);
  { ****************************************************************************
  internal set
  **************************************************************************** }
  TBorderStyle = (bsNone, bsDotted, bsDsahed, bsSolid, bsDouble, bsGrove, bsRidge,
          bsInset, bsOutset);
  { ****************************************************************************
  internal set
  **************************************************************************** }
  TElevationType = (etAlongPath, etForLocations);
  { ****************************************************************************
  https://developers.google.com/maps/documentation/javascript/reference?hl=en#ElevationStatus
  **************************************************************************** }
  TElevationStatus = (esINVALID_REQUEST, esOK, esOVER_QUERY_LIMIT, esREQUEST_DENIED,
          esUNKNOWN_ERROR, esNO_REQUEST);

  { ****************************************************************************
  internal set
  **************************************************************************** }
  TGradient = (grHot, grCool);

implementation

end.

