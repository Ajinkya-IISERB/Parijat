# A treemap R script produced by the Revigo server at http://revigo.irb.hr/
# If you found Revigo useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# author: Anton Kratz <anton.kratz@gmail.com>, RIKEN Omics Science Center, Functional Genomics Technology Team, Japan
# created: Fri, Nov 02, 2012  7:25:52 PM
# last change: Fri, Nov 09, 2012  3:20:01 PM

# -----------------------------------------------------------------------------
# If you don't have the treemap package installed, uncomment the following line:
# install.packages( "treemap" );
library(treemap) 								# treemap package by Martijn Tennekes

# Set the working directory if necessary
# setwd("C:/Users/username/workingdir");

# --------------------------------------------------------------------------
# Here is your data from Revigo. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency","value","uniqueness","dispensability","representative");
revigo.data <- rbind(c("GO:0000278","mitotic cell cycle",0.3418448967340631,1.2676062401770316,0.9891964946610539,0.00955884,"mitotic cell cycle"),
c("GO:0005975","carbohydrate metabolic process",5.521546466478484,0.38721614328026455,0.9314489347841386,0.09441481,"carbohydrate metabolic process"),
c("GO:0006081","cellular aldehyde metabolic process",0.40854147241771294,0.494850021680094,0.9321833885342901,0.07233849,"cellular aldehyde metabolic process"),
c("GO:0006091","generation of precursor metabolites and energy",2.62835465282124,5.455931955649724,0.9227864671100958,0.08898752,"generation of precursor metabolites and energy"),
c("GO:0006457","protein folding",1.0590625918025878,3.552841968657781,0.9879114511125643,0.00869707,"protein folding"),
c("GO:0006629","lipid metabolic process",4.558650411488468,1,0.9331974244203973,0.07309419,"lipid metabolic process"),
c("GO:0006890","retrograde vesicle-mediated transport, Golgi to endoplasmic reticulum",0.08378316601313868,6.443697499232713,0.916563721201913,-0,"retrograde vesicle-mediated transport, Golgi to endoplasmic reticulum"),
c("GO:0006810","transport",18.43241959157694,1.2291479883578558,0.853199480234828,0.54562749,"retrograde vesicle-mediated transport, Golgi to endoplasmic reticulum"),
c("GO:0006839","mitochondrial transport",0.12250656188931323,2.1249387366083,0.8458098843655135,0.62025437,"retrograde vesicle-mediated transport, Golgi to endoplasmic reticulum"),
c("GO:0007034","vacuolar transport",0.19504391090731824,3.721246399047171,0.839717045312688,0.64989627,"retrograde vesicle-mediated transport, Golgi to endoplasmic reticulum"),
c("GO:0008104","protein localization",3.045078529796193,4.823908740944319,0.7952387604005823,0.35671052,"retrograde vesicle-mediated transport, Golgi to endoplasmic reticulum"),
c("GO:0016192","vesicle-mediated transport",1.624410201635736,4.958607314841775,0.8933535932444654,0.24620984,"retrograde vesicle-mediated transport, Golgi to endoplasmic reticulum"),
c("GO:0017038","protein import",0.050498075604885916,1.853871964321762,0.8583296729080956,0.61071314,"retrograde vesicle-mediated transport, Golgi to endoplasmic reticulum"),
c("GO:0033036","macromolecule localization",3.705455122637613,1.8239087409443189,0.8835573025766356,0.41260575,"retrograde vesicle-mediated transport, Golgi to endoplasmic reticulum"),
c("GO:0048193","Golgi vesicle transport",0.41485123723278794,4.552841968657781,0.9040853629539808,0.64489998,"retrograde vesicle-mediated transport, Golgi to endoplasmic reticulum"),
c("GO:0051169","nuclear transport",0.3609238693114327,1.6197887582883939,0.8308715250297446,0.69377275,"retrograde vesicle-mediated transport, Golgi to endoplasmic reticulum"),
c("GO:0051170","import into nucleus",0.11887437254927005,2.1739251972991736,0.8416803782882194,0.61842891,"retrograde vesicle-mediated transport, Golgi to endoplasmic reticulum"),
c("GO:0051641","cellular localization",3.7434567372987795,3.886056647693163,0.8733584882748966,0.40065528,"retrograde vesicle-mediated transport, Golgi to endoplasmic reticulum"),
c("GO:0071702","organic substance transport",6.066900404037823,0.494850021680094,0.874509636962816,0.61057863,"retrograde vesicle-mediated transport, Golgi to endoplasmic reticulum"),
c("GO:0098660","inorganic ion transmembrane transport",2.8120629398541377,0.5086383061657274,0.8721804216779856,0.42115387,"retrograde vesicle-mediated transport, Golgi to endoplasmic reticulum"),
c("GO:1902600","proton transmembrane transport",0.965460540320761,3.0132282657337552,0.8741881502043198,0.31490904,"retrograde vesicle-mediated transport, Golgi to endoplasmic reticulum"),
c("GO:1990542","mitochondrial transmembrane transport",0.07024228432512059,2.9208187539523753,0.9112655559307972,0.19230279,"retrograde vesicle-mediated transport, Golgi to endoplasmic reticulum"),
c("GO:0007017","microtubule-based process",0.8354933550892162,0.38721614328026455,0.9882060968834108,0.01047416,"microtubule-based process"),
c("GO:0009056","catabolic process",6.059177012419161,1.6777807052660807,0.9566270165915013,0.04063006,"catabolic process"),
c("GO:0009058","biosynthetic process",28.23839282673206,0.36653154442041347,0.9439763327620034,0.07243865,"biosynthetic process"),
c("GO:0044238","primary metabolic process",54.063119334849006,0.3279021420642826,0.9359899011609812,0.15678936,"biosynthetic process"),
c("GO:0009199","ribonucleoside triphosphate metabolic process",0.5924892444620421,3.552841968657781,0.7399711909192511,0.07514611,"ribonucleoside triphosphate metabolic process"),
c("GO:0006508","proteolysis",5.350747086797883,6.136677139879544,0.8630177184808498,0.36604549,"ribonucleoside triphosphate metabolic process"),
c("GO:0006730","one-carbon metabolic process",0.3470171077448388,0.585026652029182,0.8535186781749134,0.29668039,"ribonucleoside triphosphate metabolic process"),
c("GO:0009059","macromolecule biosynthetic process",15.258385035486357,2.2006594505464183,0.8543600453273534,0.33214411,"ribonucleoside triphosphate metabolic process"),
c("GO:0009132","nucleoside diphosphate metabolic process",0.09319293125396481,2.769551078621726,0.7879987523252371,0.52562492,"ribonucleoside triphosphate metabolic process"),
c("GO:0009141","nucleoside triphosphate metabolic process",0.762872851553353,3.0268721464003012,0.7463259790136471,0.63608443,"ribonucleoside triphosphate metabolic process"),
c("GO:0009167","purine ribonucleoside monophosphate metabolic process",0.7014848602897662,1.6989700043360187,0.7449120865131568,0.64700535,"ribonucleoside triphosphate metabolic process"),
c("GO:0009185","ribonucleoside diphosphate metabolic process",0.05130301133775263,2.1307682802690238,0.7860215086382989,0.50092695,"ribonucleoside triphosphate metabolic process"),
c("GO:0009225","nucleotide-sugar metabolic process",0.4034923300933672,0.769551078621726,0.7609802018474469,0.55567835,"ribonucleoside triphosphate metabolic process"),
c("GO:0009423","chorismate biosynthetic process",0.20354230263241926,2.2924298239020637,0.809059372274783,0.28270511,"ribonucleoside triphosphate metabolic process"),
c("GO:0019538","protein metabolic process",18.67385374490695,8.585026652029182,0.8520158903576358,0.31635035,"ribonucleoside triphosphate metabolic process"),
c("GO:0019693","ribose phosphate metabolic process",2.299871024016621,1.7212463990471711,0.7806724003730069,0.59643514,"ribonucleoside triphosphate metabolic process"),
c("GO:0032787","monocarboxylic acid metabolic process",2.668208950140285,1.6575773191777938,0.8046081365872899,0.45619705,"ribonucleoside triphosphate metabolic process"),
c("GO:0043648","dicarboxylic acid metabolic process",1.019693916867834,0.38721614328026455,0.8232403166738257,0.54574146,"ribonucleoside triphosphate metabolic process"),
c("GO:0044249","cellular biosynthetic process",24.389190152163454,0.4559319556497244,0.8383418255614815,0.59014338,"ribonucleoside triphosphate metabolic process"),
c("GO:0044271","cellular nitrogen compound biosynthetic process",18.93399433857433,1.1487416512809248,0.7949701796727361,0.51204972,"ribonucleoside triphosphate metabolic process"),
c("GO:0046128","purine ribonucleoside metabolic process",0.11183617415775782,2.677780705266081,0.7453380912541874,0.49588512,"ribonucleoside triphosphate metabolic process"),
c("GO:0046496","nicotinamide nucleotide metabolic process",0.561705441950962,1.1487416512809248,0.7394799504988626,0.61719946,"ribonucleoside triphosphate metabolic process"),
c("GO:0055086","nucleobase-containing small molecule metabolic process",4.5204226165387285,0.5228787452803376,0.7840232827886178,0.47643772,"ribonucleoside triphosphate metabolic process"),
c("GO:0072521","purine-containing compound metabolic process",2.595262480894418,1.2291479883578558,0.847941075648825,0.22331496,"ribonucleoside triphosphate metabolic process"),
c("GO:0072524","pyridine-containing compound metabolic process",0.6882566395888947,0.721246399047171,0.8683167387031548,0.22719191,"ribonucleoside triphosphate metabolic process"),
c("GO:1901566","organonitrogen compound biosynthetic process",14.63667861962968,2.00436480540245,0.8253121029010887,0.50121883,"ribonucleoside triphosphate metabolic process"),
c("GO:1901576","organic substance biosynthetic process",27.07678740968754,0.3187587626244128,0.8593127575273092,0.66782618,"ribonucleoside triphosphate metabolic process"),
c("GO:0009853","photorespiration",0.007224464511514439,2.769551078621726,0.9546165163771722,0.05146618,"photorespiration"),
c("GO:0010118","stomatal movement",0.002085515307881931,3.136677139879544,0.9926797243396316,0.0055955,"stomatal movement"),
c("GO:0010119","regulation of stomatal movement",0.007610301474376168,4.036212172654444,0.9884919911813583,-0,"regulation of stomatal movement"),
c("GO:0030162","regulation of proteolysis",0.2778192441640164,1.6575773191777938,0.9783761188448434,0.15184247,"regulation of stomatal movement"),
c("GO:0031047","RNA-mediated gene silencing",0.1393037744966557,0.5686362358410126,0.9755304517365221,0.67612129,"regulation of stomatal movement"),
c("GO:0051246","regulation of protein metabolic process",2.1120748608858175,0.3372421683184259,0.978050999244584,0.37812548,"regulation of stomatal movement"),
c("GO:0051248","negative regulation of protein metabolic process",0.4276337497179399,1.2218487496163564,0.9703920993975402,0.6659298,"regulation of stomatal movement"),
c("GO:0019252","starch biosynthetic process",0.015100860443036627,3.6989700043360187,0.9008789249022476,0.0879292,"starch biosynthetic process"),
c("GO:0005982","starch metabolic process",0.017608800701637863,3.744727494896694,0.9274332539345168,0.63445945,"starch biosynthetic process"),
c("GO:0019748","secondary metabolic process",0.40536164365481797,0.744727494896694,0.968633873876403,0.02903228,"secondary metabolic process"),
c("GO:0032501","multicellular organismal process",2.367239488204565,0.3187587626244128,1,-0,"multicellular organismal process"),
c("GO:0034976","response to endoplasmic reticulum stress",0.12409647627076069,4.698970004336019,0.9073965783388767,-0,"response to endoplasmic reticulum stress"),
c("GO:0000160","phosphorelay signal transduction system",2.5024686913261722,0.744727494896694,0.8834146703846771,0.55024082,"response to endoplasmic reticulum stress"),
c("GO:0001101","response to acid chemical",0.046892495710557355,1.494850021680094,0.9095026504070701,0.50230838,"response to endoplasmic reticulum stress"),
c("GO:0006950","response to stress",4.90663876400189,1,0.9075928734254535,0.51550886,"response to endoplasmic reticulum stress"),
c("GO:0006970","response to osmotic stress",0.0459245771226887,1.5086383061657274,0.9046532409296343,0.64847562,"response to endoplasmic reticulum stress"),
c("GO:0006979","response to oxidative stress",0.5712981471310761,0.38721614328026455,0.9089058987234966,0.4835448,"response to endoplasmic reticulum stress"),
c("GO:0009414","response to water deprivation",0.020928329054534463,2.744727494896694,0.8691297454203384,0.37809621,"response to endoplasmic reticulum stress"),
c("GO:0009611","response to wounding",0.11923027388570284,2.5228787452803374,0.9193424257558714,0.42710415,"response to endoplasmic reticulum stress"),
c("GO:0009615","response to virus",0.1725522769170509,1.4685210829577449,0.9267320182944749,0.28313478,"response to endoplasmic reticulum stress"),
c("GO:0009628","response to abiotic stimulus",0.5491291526700982,2.0915149811213505,0.9245995294019446,0.27528935,"response to endoplasmic reticulum stress"),
c("GO:0009651","response to salt stress",0.025412020657444898,1.7695510786217261,0.908250366834029,0.6180488,"response to endoplasmic reticulum stress"),
c("GO:0009723","response to ethylene",0.050198719340596644,0.7958800173440752,0.8856769843053786,0.69557896,"response to endoplasmic reticulum stress"),
c("GO:0009743","response to carbohydrate",0.0288113773474853,1.2218487496163564,0.8973095150746613,0.61660455,"response to endoplasmic reticulum stress"),
c("GO:0009873","ethylene-activated signaling pathway",0.04296760246765356,1.5528419686577808,0.8648549211772999,0.54977195,"response to endoplasmic reticulum stress"),
c("GO:0010033","response to organic substance",1.1004436060695082,0.9208187539523752,0.8848199738822355,0.6663214,"response to endoplasmic reticulum stress"),
c("GO:0010035","response to inorganic substance",0.27040186117107107,1.2006594505464183,0.8972212864214917,0.5818234,"response to endoplasmic reticulum stress"),
c("GO:0042221","response to chemical",3.5497133630507625,1.7695510786217261,0.9105253986817183,0.38335578,"response to endoplasmic reticulum stress"),
c("GO:1901700","response to oxygen-containing compound",0.5770723968511446,1.7695510786217261,0.8908540127941009,0.47256993,"response to endoplasmic reticulum stress"),
c("GO:0040007","growth",0.09546803886256328,0.38721614328026455,1,-0,"growth"),
c("GO:0042026","protein refolding",0.09302329603753422,1.958607314841775,0.9903703171244357,0.00714983,"protein refolding"),
c("GO:0042273","ribosomal large subunit biogenesis",0.17322749160205891,1.7212463990471711,0.9630521024202132,0.00896306,"ribosomal large subunit biogenesis"),
c("GO:0022618","protein-RNA complex assembly",0.3488232238727174,1.4814860601221125,0.9561534300674179,0.64937581,"ribosomal large subunit biogenesis"),
c("GO:0043933","protein-containing complex organization",2.6611873826523444,0.5228787452803376,0.95492650040973,0.57374448,"ribosomal large subunit biogenesis"),
c("GO:0045229","external encapsulating structure organization",1.0244337243857475,0.8239087409443188,0.9588489472469843,0.47889987,"ribosomal large subunit biogenesis"),
c("GO:0061024","membrane organization",0.5237803294462255,1.275724130399211,0.9612805288661641,0.36818695,"ribosomal large subunit biogenesis"),
c("GO:0071826","protein-RNA complex organization",0.359310671664985,1.1804560644581312,0.958657585403509,0.4327859,"ribosomal large subunit biogenesis"),
c("GO:0043094","cellular metabolic compound salvage",0.33143062491751074,1.00436480540245,0.9381391154099206,0.07084901,"cellular metabolic compound salvage"),
c("GO:0043603","amide metabolic process",6.518961624921768,13.958607314841775,0.9265358549766892,0.09946664,"amide metabolic process"),
c("GO:1901564","organonitrogen compound metabolic process",29.993834591427927,1.744727494896694,0.8968923152372331,0.18637799,"amide metabolic process"),
c("GO:0045333","cellular respiration",1.1686502677974617,7.823908740944319,0.8779615950925833,0.03241348,"cellular respiration"),
c("GO:0048367","shoot system development",0.09300999131467692,1.4685210829577449,0.9551684093429818,-0,"shoot system development"),
c("GO:0007275","multicellular organism development",1.225451455855994,0.46852108295774486,0.9497704846377029,0.66915015,"shoot system development"),
c("GO:0009826","unidimensional cell growth",0.010580580852268614,0.8860566476931632,0.9399727549570022,0.47206284,"shoot system development"),
c("GO:0022622","root system development",0.04148745204977882,0.9208187539523752,0.9573153235241875,0.60749555,"shoot system development"),
c("GO:0048364","root development",0.041467494965492874,0.958607314841775,0.9573165499991504,0.60747576,"shoot system development"),
c("GO:0090558","plant epidermis development",0.027211484423894854,0.744727494896694,0.9606666613480793,0.50141991,"shoot system development"),
c("GO:0099402","plant organ development",0.09288692262824688,0.9208187539523752,0.9551720791075727,0.64256538,"shoot system development"),
c("GO:0051179","localization",18.792076186036212,1.6020599913279623,1,-0,"localization"),
c("GO:0051603","proteolysis involved in protein catabolic process",0.9636876860000256,8.259637310505756,0.8188405639049952,0,"proteolysis involved in protein catabolic process"),
c("GO:0000209","protein polyubiquitination",0.10886589477986537,3.1870866433571443,0.9084927381389172,0.23806262,"proteolysis involved in protein catabolic process"),
c("GO:0002181","cytoplasmic translation",0.12046428693071752,5.102372908709558,0.841840586401331,0.46706543,"proteolysis involved in protein catabolic process"),
c("GO:0006096","glycolytic process",0.5384787220228288,1.6020599913279623,0.7502446874678264,0.54877408,"proteolysis involved in protein catabolic process"),
c("GO:0006412","translation",5.085673767131161,13.886056647693163,0.7686900676231778,0.6800612,"proteolysis involved in protein catabolic process"),
c("GO:0006413","translational initiation",0.5201814019133255,4.3872161432802645,0.8195996644325128,0.5312573,"proteolysis involved in protein catabolic process"),
c("GO:0006414","translational elongation",0.45853729473473576,6.958607314841775,0.8217648951236666,0.27220191,"proteolysis involved in protein catabolic process"),
c("GO:0006643","membrane lipid metabolic process",0.5586553342359257,0.5376020021010439,0.8639026741397835,0.63280877,"proteolysis involved in protein catabolic process"),
c("GO:0006720","isoprenoid metabolic process",0.5931910685927647,0.4089353929735008,0.8631400511515223,0.64181355,"proteolysis involved in protein catabolic process"),
c("GO:0008202","steroid metabolic process",0.25984788976451706,0.46852108295774486,0.8602322329348411,0.47321479,"proteolysis involved in protein catabolic process"),
c("GO:0008299","isoprenoid biosynthetic process",0.5122118729218023,0.5686362358410126,0.8304293879930594,0.56752376,"proteolysis involved in protein catabolic process"),
c("GO:0009057","macromolecule catabolic process",2.3186905544982737,7.096910013008056,0.8657566145497176,0.64408511,"proteolysis involved in protein catabolic process"),
c("GO:0010467","gene expression",9.706370753664654,1.2839966563652008,0.9168124608210204,0.16944438,"proteolysis involved in protein catabolic process"),
c("GO:0016042","lipid catabolic process",0.6020586663771559,0.8239087409443188,0.8298890930837596,0.55505278,"proteolysis involved in protein catabolic process"),
c("GO:0016051","carbohydrate biosynthetic process",0.9607174066221332,0.3979400086720376,0.882672094302435,0.55455725,"proteolysis involved in protein catabolic process"),
c("GO:0016052","carbohydrate catabolic process",1.3222932073535736,0.5086383061657274,0.8571136612156576,0.66927184,"proteolysis involved in protein catabolic process"),
c("GO:0016125","sterol metabolic process",0.14975130812035134,0.8860566476931632,0.854636973935294,0.42779828,"proteolysis involved in protein catabolic process"),
c("GO:0030148","sphingolipid biosynthetic process",0.06924443011082303,3.0555173278498313,0.8305588912942874,0.14147317,"proteolysis involved in protein catabolic process"),
c("GO:0044242","cellular lipid catabolic process",0.24984939053725536,0.4089353929735008,0.8223326398960255,0.58761141,"proteolysis involved in protein catabolic process"),
c("GO:0044272","sulfur compound biosynthetic process",1.2460139050319528,0.4814860601221125,0.8864642953769142,0.18299233,"proteolysis involved in protein catabolic process"),
c("GO:0070085","glycosylation",0.6831509521924055,0.619788758288394,0.9668834953441918,0.03060607,"glycosylation"),
c("GO:0071554","cell wall organization or biogenesis",1.217525167213757,0.769551078621726,0.9877310706147179,0.01091454,"cell wall organization or biogenesis"),
c("GO:0071669","plant-type cell wall organization or biogenesis",0.05203809727561851,2.0087739243075053,0.9846621403557053,0.00685844,"plant-type cell wall organization or biogenesis"),
c("GO:1901135","carbohydrate derivative metabolic process",6.41604626743983,0.4559319556497244,0.9403395847551261,0.07446158,"carbohydrate derivative metabolic process"),
c("GO:1901615","organic hydroxy compound metabolic process",1.1950401855849182,0.5228787452803376,0.9517900369067552,0.04790383,"organic hydroxy compound metabolic process"),
c("GO:1901657","glycosyl compound metabolic process",0.4883365477543757,1.958607314841775,0.9016381775891463,0.04360131,"glycosyl compound metabolic process"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_treemap.pdf", width=16, height=9 ) # width and height are in inches

# check the tmPlot command documentation for all possible parameters - there are a lot more
treemap(
  stuff,
  index = c("representative","description"),
  vSize = "value",
  type = "categorical",
  vColor = "representative",
  title = "Revigo TreeMap",
  inflate.labels = FALSE,      # set this to TRUE for space-filling group labels - good for posters
  lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
  bg.labels = "#CCCCCCAA",   # define background color of group labels
								 # "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
  position.legend = "none"
)

dev.off()

