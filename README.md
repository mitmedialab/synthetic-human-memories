## Synthetic Human Memories: AI-Edited Images and Videos Can Implant False Memories and Distort Recollection

![synthetic](https://github.com/user-attachments/assets/c2d0042e-7695-4a70-8c78-a47f4553a18f)

## Author
- Pat Pataranutaporn
- Chayapatr Archiwaranguprok
- Samamtha W. T. Chan
- Elizabeth F. Loftus
- Pattie Maes

## Abstract
AI is increasingly used to enhance images and videos, both intentionally and unintentionally. As AI editing tools become more integrated into smartphones, users can modify or animate photos into realistic videos. This study examines the impact of AI-altered visuals on false memories—recollections of events that didn’t occur or deviate from reality. In a pre-registered study, 200 participants were divided into four conditions of 50 each. Participants viewed original images, completed a filler task, then saw stimuli corresponding to their assigned condition: unedited images, AI-edited images, AI-generated videos, or AI-generated videos of AI-edited images. AI-edited visuals significantly increased false recollections, with AI-generated videos of AI-edited images having the strongest effect (2.05x compared to control). Confidence in false memories was also highest for this condition (1.19x compared to control). We discuss potential applications in HCI, such as therapeutic memory reframing, and challenges in ethical, legal, political, and societal domains.


## Repository Structure
```
├── README.md
├── analysis                # Data analysis (Python)
│   ├── main.ipynb
│   ├── moderating.ipynb
│   └── sanity.ipynb
├── static
│   ├── result.csv          # Survey data
│   ├── imgs                # Dataset (static image)
│   │   ├── og              # condition: unedited images (Control)
│   │   └── ai              # condition: ai-edited images
│   └── vids                # Dataset (video)
│       ├── og              # condition: ai-generated videos of unedited images
│       └── ai              # conditions: ai-generated videos of ai-edited images
└── src                     # Web interface (embedded in Qualtric questionnaire)
```

## Stimulus Set
In the experiment, we utilized a carefully designed stimulus set to examine how different forms of AI-manipulated media affect memory formation. The dataset consists of 24 copyright-free images across three categories (daily life, news, and documentary/archival materials).

These 24 base images were modified into four experimental conditions:
- Control (unedited images): Original unmodified images
- AI-edited images: Images edited using Adobe Photoshop AI
- AI-generated videos of unedited images: Original images transformed into 5-second videos using Luma's Dream Machine
- AI-generated videos of AI-edited images: AI-edited images transformed into 5-second videos

The AI edits systematically target three types of content:
- People: Changes to facial expressions, ethnicity, or gender
- Objects: Addition or removal of items (military vehicles, stop signs, etc.)
- Environments: Modifications to settings, time of day, or natural elements (ice melt, backgrounds)

![Stimulus Set](https://github.com/user-attachments/assets/7300abea-2fcb-4da7-a2a1-755e47c841d7)

## Usage (Data Analysis)

**Requirements**
- ipykernel==6.29.5
- matplotlib==3.10.0
- numpy==2.2.2
- pandas==2.2.3
- scikit-posthocs==0.11.2
- scipy==1.15.1

## Usage (Web interface)

```
pnpm install                # install node modules
pnpm run dev                # run locally
```

**note**: the web is designed for deployment on Cloudflare Pages

**Variables and Secrets**
```
- NODE_VERSION              22.0.0
```


## Citation
If you use this code or data in your research, please cite:

```
@inproceedings{10.1145/3706598.3713697,
author = {Pataranutaporn, Pat and Archiwaranguprok, Chayapatr and Chan, Samantha W. T. and Loftus, Elizabeth and Maes, Pattie},
title = {Synthetic Human Memories: AI-Edited Images and Videos Can Implant False Memories and Distort Recollection},
year = {2025},
isbn = {9798400713941},
publisher = {Association for Computing Machinery},
address = {New York, NY, USA},
url = {https://doi.org/10.1145/3706598.3713697},
doi = {10.1145/3706598.3713697},
abstract = {AI is increasingly used to enhance images and gvideos, both intentionally and unintentionally. As AI editing tools become more integrated into smartphones, users can modify or animate photos into realistic videos. This study examines the impact of AI-altered visuals on false memories—recollections of events that didn’t occur or deviate from reality. In a pre-registered study, 200 participants were divided into four conditions of 50 each. Participants viewed original images, completed a filler task, then saw stimuli corresponding to their assigned condition: unedited images, AI-edited images, AI-generated videos, or AI-generated videos of AI-edited images. AI-edited visuals significantly increased false recollections, with AI-generated videos of AI-edited images having the strongest effect (2.05x compared to control). Confidence in false memories was also highest for this condition (1.19x compared to control). We discuss potential applications in HCI, such as therapeutic memory reframing, and challenges in ethical, legal, political, and societal domains.},
booktitle = {Proceedings of the 2025 CHI Conference on Human Factors in Computing Systems},
articleno = {538},
numpages = {20},
keywords = {Memory, AI-generated Media, Misinformation, Generative AI, Human-AI Interaction},
location = {
},
series = {CHI '25}
}
```

## Contact
For questions about the code or data, please contact: patpat[at]mit.edu / pub[at]from.pub
