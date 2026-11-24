Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F37606A31E
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2026 08:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=y4zmEq8c
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E6810F339;
	Tue, 24 Nov 2026 08:46:28 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010046.outbound.protection.outlook.com [52.101.61.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB7710F33A;
 Tue, 24 Nov 2026 08:46:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zknl/jAzxi5KowY6ujhtCtk9s/I7ZLIJVErnZoYfTszb5YDWDvKVUApP7yVoYD75fc/u79ZnywArrJvr8++KsGNkOps5JIyxnWYRgOdDq7bO6WY2I2nF3YLJGUHc3mzajiBk2DNXtDWzhe+2pDu6fAgZls9aW5n/0yYdEoFPHF9IyJuPkLFirwEvmbJ3nZ6zhdKoxrQJyvUEaU6iC0e+O/opK8ZCzn8Fq0fkrc86NMn7hIgxF+ErFWybF+8AfCEHiCc3Jo1mc2/SeaoPgQ73ijKbbGQPfCQlgLWj4uP6QQ4aUcSmoIKF7x3VHKeJvY/COjeX/fHUasNbt+RqDFWI6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oy1FBY3LVNKVVkyC32gAmuLHP6t76a9fH0FegoKgsTE=;
 b=wqoa2lUR8Rd6LvmrMJEm/QUi+CxfGlwrQ2ovapDELzd3fyz3HDKqGAW7tDUteC29MLTUqly2Wlmh11c287TEzHhGnSOs2DjQq+JkfLfouo6TJw85zFdVthn6uLGkhRw9uPrBV8NkV3xjLrbyVT0my7CRaEA9vZKzy2nEmofiiPrsULJ23i7u8sV+fxMT25KArc5RGpTTdii1sDsDcqC/saFNDCvCcd6cWJlds2TD7j7/3qcs99e/ynfzcfaYFSCyeHy8zH1jeFEHuZ7J4etHvaWHazwcZxwJbx1TNDJPQlIISh7yAHaEc36Ogl8llLm3fIpTHp4d6sGk4Q11EeyDsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oy1FBY3LVNKVVkyC32gAmuLHP6t76a9fH0FegoKgsTE=;
 b=y4zmEq8cUsWBPxf1m/YA0TpSdO+WjQvxoE0FeC6dZBfwa1chqegTZ7zsZUfNEOnIFwdkMXzuWVqTOr5oxrY5B+VAvasMeHnwqNHYCz6EthxL3Hw1idHsVpjxW38sgwpOeMvpeBEqxakNbXNW98OOif4F8XR9DinjfexwmZGt2ys=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA3PR12MB707400.namprd12.prod.outlook.com (2603:10b6:208:715::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 08:46:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%3]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 08:46:19 +0000
Message-ID: <a7c343d6-5eae-43dc-9b6c-3ea386510fcb@amd.com>
Date: Tue, 24 Nov 2026 09:46:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/gem_mmap_offset: Accept partial read in
 oob-read
To: "David Hildenbrand (Arm)" <david@kernel.org>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Felix Kuehling <felix.kuehling@amd.com>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Prosyak,
 Vitaly" <Vitaly.Prosyak@amd.com>
References: <20261123211018.12339-1-david@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20261123211018.12339-1-david@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA3PR12MB707400:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f3b889f-88ee-4fb6-ad10-08df4a0768e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|6133799003|18002099003|22082099003|260925021911599003|260925021311599003|260925022911599003|261009223027099003|261021121427099003|261021123027099003|261026140227099003|261022105027099003|261102123227099003|261026121527099003|261022113327099003|261022075727099003|261028144727099003|56012099006|10067099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: xukJi56Q3O1Bds2+7zAkkwVqSHAx6STGN3rBMsN0P83YQEQ8bZ+Tfvr4uEeV9wM6a+650C8URUW95hiui/dzn0JwEzCN1drkAoKAUBkiZJchrhBplSvgA4mt28o3JHfSFCeMe4A0eKO10Dcv8X2hk84pL+ZHUiNoOF1uG+0Zccf2nAbibTC0JfDeyK4CZa9EC9N5/C/YZx9vYEedQKCKiRXZlw0nTUXu3NFu4VehFbRIcdX9hr5J/tA80ww9CrQzu5AsINosVHHWfmLPQVXSemOnclpj2R1Upt0zJd2Y/CUxLMhEit/dMQ9Ij3RQszhMtR/Y6cttgppPd8pwEJbXkxvZAsW+ZRNXqTEjADEeBiNsaBmGpaW3gVTtSFpb2IRvpZjen2QOL1mblrtegtfebkwJmP648/8wahzAQkyae+Dm7cVIdO226VGYUqyDe869/MJL6y60Y6muwmoG3BUWemxu5LxJusnVsuv399qmwCWjWI3ClucDpPffb0REwDDMDKTiUknP+EWJsLUt7q8loVmmceiZ+jynWXTcty66w1NUTusqkhsSG/sWwhuRnwTjF7/Cj3ge+tnsCi9rWOl0ocp3XjQ5mptq1YdOHbgsAOw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(260925021911599003)(260925021311599003)(260925022911599003)(261009223027099003)(261021121427099003)(261021123027099003)(261026140227099003)(261022105027099003)(261102123227099003)(261026121527099003)(261022113327099003)(261022075727099003)(261028144727099003)(56012099006)(10067099003)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1Z0YytzZ3RiTXNMTzVFYkZGcVYzcVpDQ2tnaUFoK2Z5dFRXNEJIRXZYbHIw?=
 =?utf-8?B?NU9yclpnTFhOVDAyNXI3RlFEanFKQ1dVQ0Z5QlBHeFIwMkJXTitZaXhSa0Fh?=
 =?utf-8?B?ekFBR2tlN2dmcHlFWjk4bkpmR1VTT3VFbXJmbnVQTkp1R0hjc0xKWEZEakd3?=
 =?utf-8?B?alZaLzhQcEh4QmVrRllRLzBXRmUxbnYrS1VzclRUMnVpNXF5TGlha2lyWWtr?=
 =?utf-8?B?OFYrWlVBY0ZKdDFkaUpMQzVXUXdYWG81bFh1cGZRU2FVZVdtTkxpUUsxb1dC?=
 =?utf-8?B?VkpJdTJjdkEyTGd3anVxODBsWWhZVC9GYXdlVHRsaE5FczMvdkd2SEVLb1VL?=
 =?utf-8?B?QUg2SzE5Sk9RZU1tcnlvQU8xclo3QjRoVUFPWWlGVzF0T0ZXUVR3UC9sajNv?=
 =?utf-8?B?UXFTVU1wQXVhNDA1UG5YQ1Yva1hSb0laUnpva1l3SUU2Y1BYcWl5dndNVUMz?=
 =?utf-8?B?K25taW8reWJpK3luZEx0SjdnMlBvd3VxWWVMOEFBNnI1Qmp0THdicUhxZ0w4?=
 =?utf-8?B?bExCaWZiZTBBaStTRmRXU2o1dURaY2ZsQzQ2WjM4QTdwR0hEMmNCMnA0K2hL?=
 =?utf-8?B?VHlTZzQ5dlQwaE1UNUxuTUZCQlhXUkFBTm4yZ0lGaEFGREtjMHQ5YTBOV3Y2?=
 =?utf-8?B?aTR2dWZDZEFoVHdUZXJkc2JQRHc2U21NQ2tkbFAxTEI2QXB5eE5sOGo1Tm96?=
 =?utf-8?B?S3psVlVoSmJtMHhMYmhWUDJOaGZ1d2ZxbmFuSEZWWHNIQ1NJUGNWSzBMVmtP?=
 =?utf-8?B?bHZWNG5rd3dwL0lGbWNQN0drNmY2eW96YkF1M3NHam1UODJ3bit4RVR2MmRl?=
 =?utf-8?B?RURZL0tyQjRDQ3d5V3d0Z3lNbTZBM2hjQVFVTDhINXpvVkpjd1hVZElJN3FT?=
 =?utf-8?B?NG5MMGt0M1I1VElrelNJUUZWZzJObUxZZFNIZTZrQzJNQTE5eXpLQ20yMGNn?=
 =?utf-8?B?ZHZkdGhYUTV0V0lVSkVROEdGdTBZSzRzUUZ0TE5vLzVmeTcwV3FtMHdmWXUv?=
 =?utf-8?B?MGFwck5yeEw1NE9WSUhlWG9GWTlpbDlMeDJmcVh4cUk0b24xTlJHL0JZczdx?=
 =?utf-8?B?KzRMbW92Nm9sR1YzME1wdnJIdUNTZ3ZsZE1RUmkvdEFRTExLVHJuMERRZkFK?=
 =?utf-8?B?RkhobTNNbVJlbzFiMlBzczNvMDBBcTduOXFVU3doMEpHdHlVVjhtNklIa0dR?=
 =?utf-8?B?RjFXMVhhUTN6Rzd2N3ZGaWM4ek5OekdtMnU3MHNVU1RLU1NvY0QxN25naTZE?=
 =?utf-8?B?L001Q1F4ZElqTUxTZ2JrOUlNVGFoenJXQWlwNlhxQytPaFZ0UGthTkxvSFNC?=
 =?utf-8?B?ZDdEU2M2SWVoT0lVd0NhY0ZoTEpLQ3kzbGFFZzl3d1k3N2hQYkpsTnQ3Rkcr?=
 =?utf-8?B?Tmk1OWcrOUxLQ2l4MXltSmhsTklNTXEvbzBwVzlpMm1BRWduSEJTUmd0bHN1?=
 =?utf-8?B?dkh6Y0pVUVZZRFNISjRxakFtZlA5MzRBaUw0TFJMWDhHSUxoc1J1VXRTWEp2?=
 =?utf-8?B?MVU5b2ROcDdMSURjTXZUN2VNVUppcDlVREU1NitMQjVyYUswY1VIcG96d1A3?=
 =?utf-8?B?Y1NQeVlYZ2hzd2ttZlhoTW9KR1pnZllET2JmdERjcUhaSHloYW41RUc3R2VW?=
 =?utf-8?B?VC9PU2xFbUxvS21qcjd0bGYzTEI3UitFd0s2L3FXdzgwSm5Hei94UE1nSWRy?=
 =?utf-8?B?Z3pwcndkMy9LRHhvQUZrZ2xhMnVHTjJaYnl3emtzNG5nVndaQllicWlYRmww?=
 =?utf-8?B?c2FzbDRkSmJQQ05tUzF0enhZUUxCdzVaOUVWUU9LSk1TcW9uUmdraDN5UWVr?=
 =?utf-8?B?ZVdIdUppelpmY29LU3dvaDF4ZXpFdEhKSEl6UTEyWlI1bUR6Y2JSQjRENGNM?=
 =?utf-8?B?TTBlQTdvMVFrbSszUFVDUzIxKy9nRnBpc0Y5Tlh2VVJtWDFKb283SjRDWGJR?=
 =?utf-8?B?UklQQVhlczB5UWFiaDlRdFZ4TjlBUVpkTXQ5QU53YStMUytkbGJQdThNU0E3?=
 =?utf-8?B?SkNXakgxNXlyTVNEQmZEMEIwNTJSNkE5ZEF3VE9SelYvQll4Q1IyVEdvRXJH?=
 =?utf-8?B?Z0hWR1JCVnNlWnpUNHVUMlRONEdvUnYxY1JlMUg2STdVSEkvOEM2ek5CbHdQ?=
 =?utf-8?B?KzdPOVlQam5VSWdJWlFhR0FLbW9VWjdzK2hIV1h5aXBHQ0ZqTTh0eHFtaWlP?=
 =?utf-8?B?YjZmYmR5d3FobEl1bjRNTWRsdEQwMm85SzNhQUFDN2hHTGoyOXdhQ0pQVHNM?=
 =?utf-8?B?eWhJYnBVWEJqSlJuak5XVjBtYUR0NktHb2g5WjhoTWV1ZUp2SGkyZ1NXaWx5?=
 =?utf-8?Q?foRAXGmIGWEEKqn0ih?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f3b889f-88ee-4fb6-ad10-08df4a0768e0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:46:19.7714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vYUADv1vJGrGa5ky6LjtGHE0VR2yyYDvzv4210MTkiOfjFHPOfBN72KBwB5+Z4Y3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR12MB707400
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/23/26 22:10, David Hildenbrand (Arm) wrote:
> The oob-read test reads 8 bytes through /proc/self/mem, assuming that
> the kernel would reject the entire read with EIO.
> 
> However, we have 4 remaining bytes in the 4 KiB mapping we can read, so
> it's valid for the kernel to only do a partial read that covers these 4
> bytes. Allow that as well.

If I understand it correctly what happens is that userspace tries to read over the end of one VMA into the next, right?

Mhm, allowing that makes sense from the uAPI point of view but I'm not sure if that can't cause problems apart from that test case.

> Otherwise, the test will fail on a kernel with upcoming vm_ops->access
> fixes, whereby vm_ops->access is limited to the current VMA, so the
> read would continue with the next mapping (if any).
> 
> So we have to make sure that nothing is mapped after the GEM mapping.
> Let's reserve an 8 KiB memory region, map the GEM object into the first
> 4 KiB slot, and create a hole by unmapping the second 4 KiB slot.
> 
> With the kernel changes in place:
> 
>   $ build/tests/gem_mmap_offset --run-subtest oob-read
>   [...]
>   Using IGT_SRANDOM=1795467759 for randomisation
>   Opened device: /dev/dri/card1
>   Starting subtest: oob-read
>   Subtest oob-read: SUCCESS (0,000s)
> 
> Link: https://lore.kernel.org/r/20261122-access_shite-v2-0-808d8d2aa700@kernel.org
> Cc: Felix Kuehling <felix.kuehling@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Adding Vitaly on CC to take a look as well and maybe double check with AMDs CI if your patch breaks anything.

Regards,
Christian.

> ---
>  tests/intel/gem_mmap_offset.c | 35 ++++++++++++++++++++++++++++-------
>  1 file changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
> index d3c56ab40..e4c0cfbd9 100644
> --- a/tests/intel/gem_mmap_offset.c
> +++ b/tests/intel/gem_mmap_offset.c
> @@ -482,13 +482,29 @@ test_oob_read(int i915)
>  	handle = gem_create(i915, 4096);
>  
>  	for_each_mmap_offset_type(i915, t) {
> -		uint32_t *ptr;
> +		struct drm_i915_gem_mmap_offset arg = {
> +			.handle = handle,
> +			.flags = t->type,
> +		};
> +		void *ptr;
>  
> -		ptr = __mmap_offset(i915, handle, 0, 4096,
> -				    PROT_READ | PROT_WRITE,
> -				    t->type);
> -		if (!ptr)
> +		if (mmap_offset_ioctl(i915, &arg))
> +			continue;
> +
> +		/* Reserve a region for mapping + hole to stop read(). */
> +		ptr = mmap(NULL, 8192, PROT_NONE,
> +			   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +		igt_assert(ptr != MAP_FAILED);
> +
> +		/* Place our mapping into the first slot. */
> +		if (mmap(ptr, 4096, PROT_READ | PROT_WRITE,
> +			 MAP_SHARED | MAP_FIXED, i915, arg.offset) == MAP_FAILED) {
> +			munmap(ptr, 8192);
>  			continue;
> +		}
> +
> +		/* And our hole into the second slot. */
> +		munmap(ptr + 4096, 4096);
>  
>  		memfd = open("/proc/self/mem", O_RDWR);
>  		igt_require_f(memfd != -1, "/proc/self/mem\n");
> @@ -497,9 +513,14 @@ test_oob_read(int i915)
>  		ret = lseek(memfd, addr, SEEK_SET);
>  		igt_assert_f(ret != -1, "lseek failed\n");
>  
> -		/* Triggering the buf (out of bound read) */
> +		/*
> +		 * Read across the end of the mapping. The read is either
> +		 * rejected entirely, or completes partially for the remaining
> +		 * 4 bytes in the mapping.
> +		 */
>  		ret = read(memfd, read_buf, 8);
> -		igt_assert(ret == -1 && errno ==  EIO);
> +		igt_assert_f((ret == -1 && errno == EIO) || ret == 4,
> +			     "ret=%d errno=%d\n", ret, errno);
>  
>  		munmap(ptr, 4096);
>  		close(memfd);

