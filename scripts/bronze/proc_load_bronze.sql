ALTER PROC bronze.load_bronze AS
BEGIN
	SET
	NOCOUNT ON;
	
	DECLARE @_Starttime DATETIME,
			@_Endtime DATETIME;
			@_Result DATETIME;
	BEGIN TRY 
		set @_Starttime = getdate();
	
		PRINT 'Loading Bronze1' 
		
		TRUNCATE TABLE bronze.crm_cust_info;
		BULK INSERT bronze.crm_cust_info
		FROM '/data/Baraa/source_crm/cust_info.csv' 
		WITH ( FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
	
	
	
	
		TRUNCATE TABLE bronze.crm_prd_info;
		
		BULK INSERT bronze.crm_prd_info
		FROM '/data/Baraa/source_crm/prd_info.csv' 
		WITH ( FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
	
	
	
	
		TRUNCATE TABLE bronze.crm_sales_details;
		
		BULK INSERT bronze.crm_sales_details
		FROM'/data/Baraa/source_crm/sales_details.csv' 
		WITH ( FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
	
	
		TRUNCATE TABLE bronze.erp_cust_az12;
		
		BULK INSERT bronze.erp_cust_az12
		FROM '/data/Baraa/source_erp/CUST_AZ12.csv' 
		WITH ( FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		
		
		TRUNCATE TABLE bronze.erp_loc_a101;
		
		BULK INSERT bronze.erp_loc_a101
		FROM '/data/Baraa/source_erp/LOC_A101.csv' WITH ( FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
	
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM '/data/Baraa/source_erp/PX_CAT_G1V2.csv' WITH ( FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
	

	END TRY 
	BEGIN CATCH 
		PRINT N'lỗirồi '
	END CATCH
END; 





exec bronze.load_bronze

































