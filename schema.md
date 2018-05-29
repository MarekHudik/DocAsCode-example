```{.mermaid width=1500}
graph LR;
    local[local edit <br/> in Atom]-->|commit|github;
    local-->|test manual build<br/>in docker image|local
    github-->|triggers|jenkins[jenkins or <br/> travis-ci or circle-ci];
    template[html template]-->docker;
    jenkins-->|starts|docker[docker image <br/>with pandoc and plugins];
    docker-->|md build to <br/> html and pdf|jenkins;
    jenkins-->|deploys html/pdf|s3[web server <br/>or aws s3];
    s3-->|customer comments <br/>using hypothes.is|s3
```
