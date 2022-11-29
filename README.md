
<!-- README.Rmd is adapted from usethis::use_readme_rmd(). See the source file here on Github: https://github.com/r-lib/usethis/blob/master/inst/templates/project-README -->
<!-- README.md is generated from README.Rmd. Please edit that file. -->

# Don’t mess with Texas

<!-- badges: start -->
<!-- badges: end -->

Highlight executed offenders database from Texas Dept of Justice

    #> .
    #> ├── CITATION
    #> ├── LICENSE
    #> ├── README.Rmd
    #> ├── code
    #> │   ├── 01-import.R
    #> │   ├── 02-tidy.R
    #> │   ├── 03-wrangle.R
    #> │   ├── 04-visualize.R
    #> │   ├── 05-model.R
    #> │   ├── 06-communicate.R
    #> │   ├── runall.R
    #> │   └── scrape_death_row.R
    #> ├── data
    #> │   ├── 2022-11-01
    #> │   │   ├── ExecutedOffenders.rds
    #> │   │   └── Links.rds
    #> │   ├── 2022-11-21
    #> │   │   ├── ExecutedOffenders.rds
    #> │   │   ├── ExecutedOffendersComplete.csv
    #> │   │   ├── ExecutedOffendersComplete.rds
    #> │   │   └── Links.rds
    #> │   ├── README.md
    #> │   ├── jpgs
    #> │   │   ├── _coble.jpg
    #> │   │   ├── _jonesrj.jpg
    #> │   │   ├── _ramos.jpg
    #> │   │   ├── adanandusdwight.jpg
    #> │   │   ├── aguilarjesus.jpg
    #> │   │   ├── albajohn.jpg
    #> │   │   ├── aldrichdonald.jpg
    #> │   │   ├── alexandercaruthers.jpg
    #> │   │   ├── allridgejames.jpg
    #> │   │   ├── allridgeronald.jpg
    #> │   │   ├── amadorjohn.jpg
    #> │   │   ├── amosbernard.jpg
    #> │   │   ├── andersonjohnny.jpg
    #> │   │   ├── andersonlarry.jpg
    #> │   │   ├── andersonrobert.jpg
    #> │   │   ├── arnoldjermarr.jpg
    #> │   │   ├── atworthrobert.jpg
    #> │   │   ├── bagwelldennis.jpg
    #> │   │   ├── bakerstanley.jpg
    #> │   │   ├── baldreeernest.jpg
    #> │   │   ├── bandaesequel.jpg
    #> │   │   ├── barberdanny.jpg
    #> │   │   ├── barefieldjohn.jpg
    #> │   │   ├── barefootthomas.jpg
    #> │   │   ├── barnardharold.jpg
    #> │   │   ├── barnesodell.jpg
    #> │   │   ├── barneswillis.jpg
    #> │   │   ├── barneyjeffery.jpg
    #> │   │   ├── basscharles.jpg
    #> │   │   ├── beathardjames.jpg
    #> │   │   ├── beaversrichard.jpg
    #> │   │   ├── beazleynapolean.jpg
    #> │   │   ├── beetsbetty.jpg
    #> │   │   ├── behringerearl.jpg
    #> │   │   ├── belyeuclifton.jpg
    #> │   │   ├── bigbyjames.jpg
    #> │   │   ├── blackmonricky.jpg
    #> │   │   ├── bluecarl.jpg
    #> │   │   ├── bonhamanotnio.jpg
    #> │   │   ├── bowerlester.jpg
    #> │   │   ├── boydcharles.jpg
    #> │   │   ├── boylebenjamin.jpg
    #> │   │   ├── bradfordgayland.jpg
    #> │   │   ├── briddlejames.jpg
    #> │   │   ├── bridgewarren.jpg
    #> │   │   ├── brimagerichard.jpg
    #> │   │   ├── brousardwindell.jpg
    #> │   │   ├── brownmauriceo.jpg
    #> │   │   ├── brucekenneth.jpg
    #> │   │   ├── buntionc.jpg
    #> │   │   ├── burksjohn.jpg
    #> │   │   ├── burnswilliam.jpg
    #> │   │   ├── busbyjasen.jpg
    #> │   │   ├── butlerjerome.jpg
    #> │   │   ├── buxtonlawrence.jpg
    #> │   │   ├── caldwelljeffrey.jpg
    #> │   │   ├── callinsbruce.jpg
    #> │   │   ├── camachogenero.jpg
    #> │   │   ├── cannonjoseph.jpg
    #> │   │   ├── cantuandrew.jpg
    #> │   │   ├── cantudomingo.jpg
    #> │   │   ├── cantup.jpg
    #> │   │   ├── carterrobertanthony.jpg
    #> │   │   ├── carterrobertearl.jpg
    #> │   │   ├── cartwrightrichard.jpg
    #> │   │   ├── caseygerald.jpg
    #> │   │   ├── castillodavid.jpg
    #> │   │   ├── chamberstony.jpg
    #> │   │   ├── chappellwilliam.jpg
    #> │   │   ├── chavezjohn.jpg
    #> │   │   ├── clarkdavid.jpg
    #> │   │   ├── clarkherman.jpg
    #> │   │   ├── clarkjack.jpg
    #> │   │   ├── claytonjames.jpg
    #> │   │   ├── cockrumjohn.jpg
    #> │   │   ├── colburnjames.jpg
    #> │   │   ├── colemanclydell.jpg
    #> │   │   ├── collierjames.jpg
    #> │   │   ├── cookanthony.jpg
    #> │   │   ├── cookbobby.jpg
    #> │   │   ├── cooksvincent.jpg
    #> │   │   ├── cordovageorge.jpg
    #> │   │   ├── corwindaniel.jpg
    #> │   │   ├── coulsonrobert.jpg
    #> │   │   ├── cranealvin.jpg
    #> │   │   ├── crankdenton.jpg
    #> │   │   ├── crawfordhilton.jpg
    #> │   │   ├── cruzjavier.jpg
    #> │   │   ├── cruzoliver.jpg
    #> │   │   ├── cuevasignacio.jpg
    #> │   │   ├── curryalva.jpg
    #> │   │   ├── davisjames.jpg
    #> │   │   ├── daviswilliam.jpg
    #> │   │   ├── delacruzjose.jpg
    #> │   │   ├── delarosajesse.jpg
    #> │   │   ├── delkmonty.jpg
    #> │   │   ├── delunacarlos.jpg
    #> │   │   ├── demouchettejames.jpg
    #> │   │   ├── derrickmikel.jpg
    #> │   │   ├── dillinghamjeffery.jpg
    #> │   │   ├── dinkinsrichard.jpg
    #> │   │   ├── doughtiejeffery.jpg
    #> │   │   ├── dowthittdennis.jpg
    #> │   │   ├── drewrobert.jpg
    #> │   │   ├── drinkardrichard.jpg
    #> │   │   ├── dudleymarion.jpg
    #> │   │   ├── duffsmithmarkum.jpg
    #> │   │   ├── duncanrichard.jpg
    #> │   │   ├── dunnhenry.jpg
    #> │   │   ├── dunnkenneth.jpg
    #> │   │   ├── earhartjames.jpg
    #> │   │   ├── elizaldejaime.jpg
    #> │   │   ├── elliottjohn.jpg
    #> │   │   ├── ellisedward.jpg
    #> │   │   ├── emeryjeff.jpg
    #> │   │   ├── etheridgegary.jpg
    #> │   │   ├── evansmichael.jpg
    #> │   │   ├── farristroy.jpg
    #> │   │   ├── faulderjoseph.jpg
    #> │   │   ├── fearancejohn.jpg
    #> │   │   ├── feldersammie.jpg
    #> │   │   ├── floresandrew.jpg
    #> │   │   ├── fosterrichard.jpg
    #> │   │   ├── franklindonald.jpg
    #> │   │   ├── fuentesanthony.jpg
    #> │   │   ├── fulleraaron.jpg
    #> │   │   ├── fullertyrone.jpg
    #> │   │   ├── gallamoresamuel.jpg
    #> │   │   ├── garciagustavo.jpg
    #> │   │   ├── gardnerbilly.jpg
    #> │   │   ├── garrettjohnny.jpg
    #> │   │   ├── gentrykenneth.jpg
    #> │   │   ├── gibbsdavid.jpg
    #> │   │   ├── goffdavid.jpg
    #> │   │   ├── gonzalesjoe.jpg
    #> │   │   ├── goodmanspencer.jpg
    #> │   │   ├── goodwinalvin.jpg
    #> │   │   ├── goschlesley.jpg
    #> │   │   ├── gosscornelius.jpg
    #> │   │   ├── grahamgary.jpg
    #> │   │   ├── granvielkenneth.jpg
    #> │   │   ├── greendominique.jpg
    #> │   │   ├── greenedward.jpg
    #> │   │   ├── greengw.jpg
    #> │   │   ├── greennorman.jpg
    #> │   │   ├── greenricky.jpg
    #> │   │   ├── gribbletimothy.jpg
    #> │   │   ├── griffithmichael.jpg
    #> │   │   ├── gutierrezjessie.jpg
    #> │   │   ├── gutierrezjose.jpg
    #> │   │   ├── hafdahlrandall.jpg
    #> │   │   ├── hammondkarl.jpg
    #> │   │   ├── harriscurtis.jpg
    #> │   │   ├── harrisdanny.jpg
    #> │   │   ├── harrisdavid.jpg
    #> │   │   ├── harriskenneth.jpg
    #> │   │   ├── hawkinssamuel.jpg
    #> │   │   ├── heiselbetzearl.jpg
    #> │   │   ├── henryrobert.jpg
    #> │   │   ├── hermandavid.jpg
    #> │   │   ├── hernadezadolph.jpg
    #> │   │   ├── hernandezrodolfo.jpg
    #> │   │   ├── herreraleonel.jpg
    #> │   │   ├── hicksdavid.jpg
    #> │   │   ├── hillmack.jpg
    #> │   │   ├── hinesbobby.jpg
    #> │   │   ├── hittledaniel.jpg
    #> │   │   ├── hoguejerry.jpg
    #> │   │   ├── hollanddavid.jpg
    #> │   │   ├── hopkinsbobby.jpg
    #> │   │   ├── hoppergeorge.jpg
    #> │   │   ├── howardronald.jpg
    #> │   │   ├── hughesprestoni.jpg
    #> │   │   ├── jacksondonell.jpg
    #> │   │   ├── jacksontommy.jpg
    #> │   │   ├── jacobsbruce.jpg
    #> │   │   ├── jacobsjesse.jpg
    #> │   │   ├── jamesjohnny.jpg
    #> │   │   ├── janeckaallen.jpg
    #> │   │   ├── jenkinsleo.jpg
    #> │   │   ├── jenningsdesmond.jpg
    #> │   │   ├── jenningsrobert.jpg
    #> │   │   ├── jerniganjoseph.jpg
    #> │   │   ├── johnsoncarl.jpg
    #> │   │   ├── johnsondorsie.jpg
    #> │   │   ├── johnsoneddie.jpg
    #> │   │   ├── johnsongary.jpg
    #> │   │   ├── johnsonjohnny.jpg
    #> │   │   ├── johnsonkia.jpg
    #> │   │   ├── johnsonlonnie.jpg
    #> │   │   ├── joinerorien.jpg
    #> │   │   ├── jonesclaude.jpg
    #> │   │   ├── jonesgeorgealarick.jpg
    #> │   │   ├── jonesrichard.jpg
    #> │   │   ├── jonestj.jpg
    #> │   │   ├── kellyalvin.jpg
    #> │   │   ├── kellycarl.jpg
    #> │   │   ├── kincykevin.jpg
    #> │   │   ├── kingcalvin.jpg
    #> │   │   ├── kingleon.jpg
    #> │   │   ├── kinnamonraymond.jpg
    #> │   │   ├── kitchenswilliam.jpg
    #> │   │   ├── knightpatrick.jpg
    #> │   │   ├── knoxroy.jpg
    #> │   │   ├── kunkletroy.jpg
    #> │   │   ├── kutznerrichard.jpg
    #> │   │   ├── lackeyclarence.jpg
    #> │   │   ├── lagroneedward.jpg
    #> │   │   ├── lambjohn.jpg
    #> │   │   ├── landryraymond.jpg
    #> │   │   ├── laneharold.jpg
    #> │   │   ├── lautiaua.jpg
    #> │   │   ├── lawtonstacey.jpg
    #> │   │   ├── lealhumberto.jpg
    #> │   │   ├── littlewilliam.jpg
    #> │   │   ├── livingstoncharlie.jpg
    #> │   │   ├── lockhartmichael.jpg
    #> │   │   ├── longdavid.jpg
    #> │   │   ├── lookingbillrobert.jpg
    #> │   │   ├── losadadavis.jpg
    #> │   │   ├── lottgeorge.jpg
    #> │   │   ├── maddenrobert.jpg
    #> │   │   ├── mannfletcher.jpg
    #> │   │   ├── marquezmario.jpg
    #> │   │   ├── martinezdavid.jpg
    #> │   │   ├── martinezjohnny.jpg
    #> │   │   ├── masonthomas.jpg
    #> │   │   ├── masseyjason.jpg
    #> │   │   ├── matchettfarley.jpg
    #> │   │   ├── mayjustin.jpg
    #> │   │   ├── maysnoble.jpg
    #> │   │   ├── maysrex.jpg
    #> │   │   ├── mcbridemichael.jpg
    #> │   │   ├── mccoskeyjamie.jpg
    #> │   │   ├── mccoystephen.jpg
    #> │   │   ├── mccullumdemarco.jpg
    #> │   │   ├── mcduffkenneth.jpg
    #> │   │   ├── mcfaddenjerry.jpg
    #> │   │   ├── mcfarlandfrank.jpg
    #> │   │   ├── mcginnisglen.jpg
    #> │   │   ├── mcginnricky.jpg
    #> │   │   ├── meanesjames.jpg
    #> │   │   ├── medellinjose.jpg
    #> │   │   ├── medinajavier.jpg
    #> │   │   ├── millerdonald.jpg
    #> │   │   ├── millergarry.jpg
    #> │   │   ├── miltoncharles.jpg
    #> │   │   ├── minielpeter.jpg
    #> │   │   ├── mitchellgerald.jpg
    #> │   │   ├── montoyairineo.jpg
    #> │   │   ├── montoyaramon.jpg
    #> │   │   ├── moodyjohn.jpg
    #> │   │   ├── moodystephen.jpg
    #> │   │   ├── moorefrank.jpg
    #> │   │   ├── moorejohnathan.jpg
    #> │   │   ├── mooremichael.jpg
    #> │   │   ├── morelandjames.jpg
    #> │   │   ├── morenoeliseo.jpg
    #> │   │   ├── morinstephen.jpg
    #> │   │   ├── morriskenneth.jpg
    #> │   │   ├── morrislorenzo.jpg
    #> │   │   ├── morrowricky.jpg
    #> │   │   ├── mosleydaroyce.jpg
    #> │   │   ├── motleyjeffery.jpg
    #> │   │   ├── munizpedro.jpg
    #> │   │   ├── murphyivan.jpg
    #> │   │   ├── narvaizleopoldo.jpg
    #> │   │   ├── nennoeric.jpg
    #> │   │   ├── netherystephen.jpg
    #> │   │   ├── newtonfrancis.jpg
    #> │   │   ├── nicholsjoseph.jpg
    #> │   │   ├── noblesjohnathan.jpg
    #> │   │   ├── nunciopaul.jpg
    #> │   │   ├── obrienderrick.jpg
    #> │   │   ├── obryanronald.jpg
    #> │   │   ├── ogancraig.jpg
    #> │   │   ├── pasterjames.jpg
    #> │   │   ├── patrickjessie.jpg
    #> │   │   ├── pattersonkelsey.jpg
    #> │   │   ├── pattersontoronto.jpg
    #> │   │   ├── phillipsclifford.jpg
    #> │   │   ├── pinkertonjay.jpg
    #> │   │   ├── pippenroy.jpg
    #> │   │   ├── pondexterwillie.jpg
    #> │   │   ├── porterhenry.jpg
    #> │   │   ├── powelldavid.jpg
    #> │   │   ├── powelljames.jpg
    #> │   │   ├── prietoarnold.jpg
    #> │   │   ├── pylesjohnny.jpg
    #> │   │   ├── ransomcedric.jpg
    #> │   │   ├── ransomkenneth.jpg
    #> │   │   ├── rectorcharles.jpg
    #> │   │   ├── reevesreginald.jpg
    #> │   │   ├── reneaudaniel.jpg
    #> │   │   ├── renfrosteven.jpg
    #> │   │   ├── richardsmichael.jpg
    #> │   │   ├── richardsonjames.jpg
    #> │   │   ├── richardsonmiguel.jpg
    #> │   │   ├── riddlegranville.jpg
    #> │   │   ├── rileymichael.jpg
    #> │   │   ├── robersonbrian.jpg
    #> │   │   ├── robertsdouglas.jpg
    #> │   │   ├── robisonlarry.jpg
    #> │   │   ├── rodrigezlionell.jpg
    #> │   │   ├── rogerspatrick.jpg
    #> │   │   ├── rojasleonard.jpg
    #> │   │   ├── romerojesus.jpg
    #> │   │   ├── rougeaupaul.jpg
    #> │   │   ├── ruddemerson.jpg
    #> │   │   ├── ruizroland.jpg
    #> │   │   ├── rumbaugh.jpg
    #> │   │   ├── russellclifton.jpg
    #> │   │   ├── russelljames.jpg
    #> │   │   ├── sanmigueljessy.jpg
    #> │   │   ├── santanacarlos.jpg
    #> │   │   ├── satterwhitejohn.jpg
    #> │   │   ├── sattiewhitevernon.jpg
    #> │   │   ├── sawyersjohn.jpg
    #> │   │   ├── shamburgerron.jpg
    #> │   │   ├── shannonwillie.jpg
    #> │   │   ├── sharpmichael.jpg
    #> │   │   ├── shieldsrobert.jpg
    #> │   │   ├── skillerndoyle.jpg
    #> │   │   ├── smithcharles.jpg
    #> │   │   ├── smithclyde.jpg
    #> │   │   ├── smithjames.jpg
    #> │   │   ├── smithlarry.jpg
    #> │   │   ├── smithrichard.jpg
    #> │   │   ├── sonnierderrick.jpg
    #> │   │   ├── soriajuan.jpg
    #> │   │   ├── spencedavid.jpg
    #> │   │   ├── starvaggijoseph.jpg
    #> │   │   ├── sterlinggary.jpg
    #> │   │   ├── stewartdarryl.jpg
    #> │   │   ├── stokerdavid.jpg
    #> │   │   ├── stonebenjamin.jpg
    #> │   │   ├── streetmanrobert.jpg
    #> │   │   ├── styronronford.jpg
    #> │   │   ├── summersgregory.jpg
    #> │   │   ├── tamayoedgar.jpg
    #> │   │   ├── taylorelkie.jpg
    #> │   │   ├── teaguedelbert.jpg
    #> │   │   ├── thackercharles.jpg
    #> │   │   ├── thomasshannon.jpg
    #> │   │   ├── thompsonjohn.jpg
    #> │   │   ├── tignergerald.jpg
    #> │   │   ├── titsworthtimothy.jpg
    #> │   │   ├── trevinojoe.jpg
    #> │   │   ├── trottiewillie.jpg
    #> │   │   ├── tuckerjefferey.jpg
    #> │   │   ├── tuckerkarla.jpg
    #> │   │   ├── turnerjessel.jpg
    #> │   │   ├── tuttlecharles.jpg
    #> │   │   ├── vaughnroger.jpg
    #> │   │   ├── vegamartin.jpg
    #> │   │   ├── vickersbilly.jpg
    #> │   │   ├── vuonghai.jpg
    #> │   │   ├── walkertony.jpg
    #> │   │   ├── washingtonterry.jpg
    #> │   │   ├── webbfreddie.jpg
    #> │   │   ├── westleyanthony.jpg
    #> │   │   ├── westrobert.jpg
    #> │   │   ├── wheatjohn.jpg
    #> │   │   ├── whitakergeorge.jpg
    #> │   │   ├── whitebilly.jpg
    #> │   │   ├── whiteexcell.jpg
    #> │   │   ├── whitelarry.jpg
    #> │   │   ├── wiliamwillie.jpg
    #> │   │   ├── wilkensjames.jpg
    #> │   │   ├── wilkersonponchai.jpg
    #> │   │   ├── wilkersonrichard.jpg
    #> │   │   ├── williamsanthony.jpg
    #> │   │   ├── williamsjeffrey.jpg
    #> │   │   ├── williamswalter.jpg
    #> │   │   ├── willinghamcameron.jpg
    #> │   │   ├── wilsonjackie.jpg
    #> │   │   ├── wilsonmarvin.jpg
    #> │   │   ├── wolfebryan.jpg
    #> │   │   ├── woodsbillyjoe.jpg
    #> │   │   ├── woollsrandy.jpg
    #> │   │   └── zimmermankevin.jpg
    #> │   └── raw
    #> │       ├── 2022-11-01-ExOffndrsRaw.rds
    #> │       ├── 2022-11-21-ExOffndrsRaw.rds
    #> │       └── 2022-11-21-Links.rds
    #> ├── docs
    #> │   ├── dmwt.rdata
    #> │   ├── index.Rmd
    #> │   ├── index.html
    #> │   └── www
    #> │       ├── 2022-11-01-image-walk2.gif
    #> │       ├── crop_435_352_1-1.png
    #> │       ├── crop_750_1000_10-1.png
    #> │       ├── crop_750_1000_10_rotate90-1.png
    #> │       ├── crop_750_x_200_10-1.png
    #> │       ├── crop_850_950_60-1.png
    #> │       ├── crop_850_950_60_flip-1.png
    #> │       ├── ex_offndrs.png
    #> │       ├── info_url.png
    #> │       ├── last_statement.png
    #> │       ├── selector_gadget.png
    #> │       ├── test_magick.png
    #> │       ├── test_magick_clean-1.png
    #> │       ├── test_magick_final-1.png
    #> │       ├── test_magick_final.jpg
    #> │       ├── test_magick_img-1.png
    #> │       └── woodsbillyjoe.jpg
    #> ├── requirements.txt
    #> ├── results
    #> │   ├── figures
    #> │   │   ├── 2022-11-01-image-walk2.gif
    #> │   │   ├── ExecByRaceYear-1.png
    #> │   │   ├── add_ggp2_bjw_col_1997-1.png
    #> │   │   ├── add_ggp2_bjw_lab_repel-1.png
    #> │   │   ├── base_plot-1.png
    #> │   │   ├── build-plot-1.png
    #> │   │   ├── crop_435_352_1-1.png
    #> │   │   ├── crop_750_1000_10-1.png
    #> │   │   ├── crop_750_1000_10_rotate90-1.png
    #> │   │   ├── crop_850_950_60-1.png
    #> │   │   ├── crop_850_950_60_flip-1.png
    #> │   │   ├── ex_offndrs.png
    #> │   │   ├── gg_executions_year_04-1.png
    #> │   │   ├── gg_executions_year_04.png
    #> │   │   ├── ggp2_max_race_year_line-1.png
    #> │   │   ├── ggp2_race_year_cols-1.png
    #> │   │   ├── ggp2_total_exec_year-1.png
    #> │   │   ├── info_url.png
    #> │   │   ├── last_statement.png
    #> │   │   ├── selector_gadget.png
    #> │   │   ├── test_magick.png
    #> │   │   ├── test_magick_clean-1.png
    #> │   │   ├── test_magick_crop_750_x_200_10-1.png
    #> │   │   ├── test_magick_final-1.png
    #> │   │   ├── test_magick_final.jpg
    #> │   │   ├── test_magick_final.png
    #> │   │   ├── test_magick_flip2-1.png
    #> │   │   ├── test_magick_img-1.png
    #> │   │   ├── test_magick_rotate270-1.png
    #> │   │   ├── unnamed-chunk-1-1.png
    #> │   │   ├── unnamed-chunk-10-1.png
    #> │   │   ├── unnamed-chunk-11-1.png
    #> │   │   ├── unnamed-chunk-2-1.png
    #> │   │   ├── unnamed-chunk-3-1.png
    #> │   │   ├── unnamed-chunk-4-1.png
    #> │   │   ├── unnamed-chunk-6-1.png
    #> │   │   └── unnamed-chunk-9-1.png
    #> │   ├── manuscript
    #> │   └── tables
    #> ├── texas-djc-data.Rproj
    #> └── vignettes
    #>     ├── graphs.Rmd
    #>     ├── grid.Rmd
    #>     ├── images.Rmd
    #>     ├── import.Rmd
    #>     ├── import.html
    #>     └── magick.Rmd
