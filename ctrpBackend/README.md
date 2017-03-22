# ctrp-bddtests


The following cucumber tags are used in the project and have specific purposes.
```
@po_high         - Triggered when HIGH priority tests need to be run.
@po_medium       - Triggered when MEDIUM priority tests need to be run.
@po_low          - Triggered when LOW priority tests need to be run.
```

To run the test using cucumber
```
cucumber ctrpBackend/features/ -r ctrpBackend/features/

```


To export the results to the JIRA test execution set
```
curl -H "Content-Type: application/json" -X POST -u ahmeds6:pass --data @results/output.json  https://tracker.nci.nih.gov/rest/raven/1.0/import/execution/cucumber
```