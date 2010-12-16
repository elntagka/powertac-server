// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.powertac.server.module.databaseservice.domain;

import java.util.List;
import java.util.Random;
import org.powertac.server.module.databaseservice.domain.CashRecord;
import org.springframework.stereotype.Component;

privileged aspect CashRecordDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CashRecordDataOnDemand: @Component;
    
    private Random CashRecordDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<CashRecord> CashRecordDataOnDemand.data;
    
    public CashRecord CashRecordDataOnDemand.getNewTransientCashRecord(int index) {
        org.powertac.server.module.databaseservice.domain.CashRecord obj = new org.powertac.server.module.databaseservice.domain.CashRecord();
        obj.setAmount(new java.math.BigDecimal(index));
        obj.setBalance(new java.math.BigDecimal(index));
        obj.setBroker(null);
        obj.setCompetition(null);
        obj.setDateCreated(null);
        obj.setDescription("description_" + index);
        obj.setLatest(null);
        obj.setTransactionId(new Integer(index).longValue());
        return obj;
    }
    
    public CashRecord CashRecordDataOnDemand.getSpecificCashRecord(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        CashRecord obj = data.get(index);
        return CashRecord.findCashRecord(obj.getId());
    }
    
    public CashRecord CashRecordDataOnDemand.getRandomCashRecord() {
        init();
        CashRecord obj = data.get(rnd.nextInt(data.size()));
        return CashRecord.findCashRecord(obj.getId());
    }
    
    public boolean CashRecordDataOnDemand.modifyCashRecord(CashRecord obj) {
        return false;
    }
    
    public void CashRecordDataOnDemand.init() {
        data = org.powertac.server.module.databaseservice.domain.CashRecord.findCashRecordEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'CashRecord' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<org.powertac.server.module.databaseservice.domain.CashRecord>();
        for (int i = 0; i < 10; i++) {
            org.powertac.server.module.databaseservice.domain.CashRecord obj = getNewTransientCashRecord(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}
