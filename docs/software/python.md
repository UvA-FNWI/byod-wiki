# Python

## Installatie

```
sudo apt install python3
```

## Jupyter notebook

```
sudo apt install jupyter-notebook
```

Om jupyter notebook te openen, navigeer je naar een map via de terminal en typ je:
```
jupyter notebook
```

## Packages installeren

Voor veel vakken zul je extra packages nodig hebben, zoals bijvoorbeeld `numpy`, `scipy`, `pandas` of `sklearn`. Er zijn twee methods om packages te installeren.

### Via apt

Dit is het snelst en meest eenvoudig en werkt gegarandeerd. Helaas zijn niet alle packages beschikbaar en zijn de versies wat ouder maar dit zou geen probleem moeten zijn voor onze opleidingen.

Python packages zijn beschikbaar als de apt packages `python3-<naam>`. Bijvoorbeeld, het installeren van numpy en scipy:
```
sudo apt install python3-numpy python3-scipy
```

!!! hint "Een package vinden"
    Je kan de command `apt list "python3-*"` gebruiken om een lijst te krijgen van alle beschikbare packages (dit zijn er veel!)


### Via pip

Pip is de package manager van Python zelf. Hiermee installeer je de nieuwste versie van een package van de [Python Package Index (pypi)](https://pypi.org/).

Installeer packages als volgt:
```
pip install --user <package>
```

!!! warning "Site packages vs user packages"
    Voor nooit pip commando's als root uit (met sudo). Dit kan Python packages die nodig zijn voor het functioneren van je systeem overschrijven met nieuwere versies. Vaak gaat dit toevallig goed, maar niet altijd!

## Virtual environment

Een *virtual environment* (`venv`) is een geisoleerde omgeving met zijn eigen Python packages. Installeer eerst ondersteuning voor virtual environments:
```
sudo apt install python3-venv
```

Vervolgens kan je een `venv` maken in een map:
```
python3 -m venv venv
```

Als je gebruik wilt maken van deze virtual environment, ga je "er in" op deze manier:
```
source venv/bin/activate
```

Nu kan je veilig met pip een package installeren:
```
pip install numpy
```

Je gaat uit een environment door `deactivate` te typen of Ctrl+D.

!!! hint "Automatisch packages installeren"
    Je kan een `requirements.txt` bestand aanmaken met een lijst van Python packages (één op elke regel) en dan automatisch ze allemaal installeren met `pip install -r requirements.txt`. Dit is handig als je code stuurt naar iemand anders, zodat diegene dezelfde packages kan installeren.
