package org.collectionspace.qa.cucumber.fine_and_cont_tenant;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        glue = { "org.collectionspace.qa.cucumber.stepDefinitions" },
        tags = { "@fctenant" },
        format = { "json:target/report.json" }
		)
public class FCTenantIT {
}
