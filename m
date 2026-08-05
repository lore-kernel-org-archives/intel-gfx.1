Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4BDC55838
	for <intel-gfx@archiver.kernel.org>; Wed,  5 Aug 2026 01:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C51010E178;
	Wed,  5 Aug 2026 01:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PHm6IWBn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824E010E178
 for <intel-gfx@lists.freedesktop.org>; Wed,  5 Aug 2026 01:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785894747; x=1817430747;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cU++MFg+3MQJ0luhysv+EdQaIrOG93VigxqmYf1yLNg=;
 b=PHm6IWBneWY/+EhUbvv37cQ/Umw+g9+QaZBOOX/X0ngp95hudiCa4mCL
 lJaqLkxyIvcsAQneRWHy7Ii2M7wgs+fU/90GqwoKbtTkivfhdwU02ajre
 lLg/A5rYV5zL3HIM66qa2q31njFnhW2dJIuuiUmDUXX+mk03pbTLYhTf3
 GpmnTz3jtqWC6f20SQclU7oq//VI1wcBL0lgl/eIpz0349Oc5J47E+Abi
 YtK6g5IZsCynZUaQxSAWElCyN8UJzW4u2vfAZPTcamJ/0ZQgjhLYXG6kV
 k3Ogaa0zZG0ZKCULTqBpitbECT//9Sm3mN6uOzLKXPseGQlC2qYXixlt7 g==;
X-CSE-ConnectionGUID: bRQvWAwBS2iWbwaeKBcLYA==
X-CSE-MsgGUID: ibmlaaoySAqfRPyyrQ44hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="112009077"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="112009077"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 18:52:22 -0700
X-CSE-ConnectionGUID: mSpfyIbwTbqwTXAsb/GbNA==
X-CSE-MsgGUID: FMKw6cUVSdGTT5v9i+zDfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="257793496"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 18:51:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 18:51:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 18:51:39 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 18:51:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLICiuZzG5PwcF5uy13Lq3u+r7tzyj0ksR00fjhDLXJtVDLP67vlN1zIvfr1dYSsVHJ2r7tAIU9jze0sAd6TPLYvXFiIcz6KYWG0YuDYLVqg8viqakXe6qhsSvum0gBZljgL/Eyx78rGERX9dAjUtVf0x3HtbrvoVYQiRBzQSrzwmRcOEuNjFsxVdUg2myK2mqQSrjyrSQ/QUoeOKHAzm82vlXH0cgAhRHqE8FXuzjdVFBalUKK18Xjo3BDqN/jZZWTdMJGZgHfb5eg2znXJ7xQKxOVBetFJwbHtxf3Z+klNDOV2jN5kCAgQ64W5yUBGBWyP1SwBPD8NeDhaPlruTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVi2MuyTubSlHqsuNSnO30WZFHsomJX8uPKuxBXJiuU=;
 b=o60vj2XLhzvwyYNDpBdxbkenpwkNsHDxMHOQkumzUZYQOjTA3WtzypytdJuCWYsKdyKYJktN+DYRVeCk7A7EIcsB1M65tGg5oTkj0LvW4R1M0X4HmFX817aPmpSKNPGGmVPwLNElDS3eLO3Ij47njFdn06QNubKr7ySM0ms15NYkaZ/vrLiGZpph0Ml8y2Ov9CTn00FlYAruyG2tT5ClJd/DYtOFFDaA4PO0LGnr9YsvFZ9pJlHJdEE64V9oHl25iaJfZLXhpTXB4U6Oqp9cry0RAyJqmJM4haABPAwzowVI47bUKs5z1Otz+CMlWRFJih4lAQrjsVp5YDHSnM9JSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by SJ0PR11MB5215.namprd11.prod.outlook.com (2603:10b6:a03:2d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 01:51:31 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 01:51:31 +0000
Date: Tue, 4 Aug 2026 21:51:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Parth Kamani <parthvipulkamani@gmail.com>
CC: <intel-gfx@lists.freedesktop.org>
Subject: Re: Offering to take a TODO item in i915
Message-ID: <anKXIBhDWkYZs6dZ@intel.com>
References: <CACa-pC1wVczshOD0xE0oLMDa7q25Q2ibJzCOKyDs4vW6Ga2cCA@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CACa-pC1wVczshOD0xE0oLMDa7q25Q2ibJzCOKyDs4vW6Ga2cCA@mail.gmail.com>
X-ClientProxiedBy: DSSP220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:3d3::11) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|SJ0PR11MB5215:EE_
X-MS-Office365-Filtering-Correlation-Id: 5600b943-dcfa-4019-5698-08def2941258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|10086099003|5023799004|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6LdkZ8iJAsAbA2pMkqejHrhtCHsyPMoxcBRZ2czGxjC4Q520F04G+7O0baI8Ro7eXRXvmcvdxN0CgzLsC6iyHZXyyo8d+vqGEkBkLDtxplXTOF7ZY3PX85omv/VJ6IMFR9lGXsfZgI9KuD5OgILMYglPCSuo5ZFUiu95/3ic9kn5jQRGqWene4kaYIA/MWC27sKKKkQ+CBSsPfIDpj2Wpzx9JG1vJZmPU7JGfi1fkM+YcnUqF7VcRtBmIp4x1MQG8dRP2eRjp63uhmZSiaILc3yRrD8diqLBl930QjkZaEwz3M0BoGXgE8TExo6YMFZDiRtUxjEfsJtD7DhNP6z7MPwSFqScbvwERPdkGfVbxxsgt7QaptzZNR6GdwsAPbwJDfkihRkvKn/EUdvTL31ufNwPIz64xsj0CPqj3/wtMN2rwIDOYJijA5I7ZLnIgr2t4BmfI2Gi62Zy3FOpsoUf8H84Kqco+RtndGDmcYXKhIgrQkTlSbpR81vwGefoJSEYJ1E2qiry6JtuimQfeC19e0BhY8l5qES6gpJ+JQlg0ddItAnrcYhuvbXJHVLmn6J4YOA/Q4uzS3cSJ0n9lTQl44QfYnW7/pzuHKmQNp1uq7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(10086099003)(5023799004)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i/NM5hYK2tZFFfcBpPWz3lTMPBTp8BqHvEgLmSkGol9j2Zc8XihHjqxk8vor?=
 =?us-ascii?Q?BLwX50Wf+nS/DXEEy1IXSYno7iXQ/tbuyzzzSeMJoAyAb5e7j/HVyVkreBbk?=
 =?us-ascii?Q?QP4YNKKZfYCqijtA5DJkfC2cJDlqa5kcjU3UbQqM8x3qJsLBgzlrQr+z78Ru?=
 =?us-ascii?Q?T0QZTZv70qIAeuQ2CWwe0dDhMvVqj7ijL+rapQkQgDKmiWX5rD8pJ4TLZaiv?=
 =?us-ascii?Q?1UILUNLLwoza/XGbFaBpYQ7/2yndxlD6/qEaSb2gemWyvrjeiUQR1ZGRhtXY?=
 =?us-ascii?Q?zljoSx2YA4GBPR+l78kSuAMADuH5Yf6GtW5hC9zgd7KhVP8Sma2gnVIVB5zL?=
 =?us-ascii?Q?SWr3Jea5Z3WGDhv7JXFroYG7LuKc4LByUmS0zex8ONObMo0MxJoucjifQ8BS?=
 =?us-ascii?Q?yTuFjjk+AejCFzbjwdIu92U4/kwcfxu1QcfFriHp3eleWMK/tLsi0a4vIp23?=
 =?us-ascii?Q?GFpVrMKzevzy/E58jbWx3blOF64E23ZismFjeMjLHggF4J90l4i1ZZuPdfKl?=
 =?us-ascii?Q?PgqgdDHh9mz6V5cvgKp945cYouhLgzTs4vG1yVZiB+ADODcT8tOsnQxeXN/1?=
 =?us-ascii?Q?n7v2J1Nnepna4behrnMXKFDegyjXCmfBjhlqsNM/oGtMLSv7/PPsRfTjQdCB?=
 =?us-ascii?Q?bRZL+Dw1y2YpIaZJMl3x8cBP/gOEsayC9cbFKL+QWMjSq/IIHZN8kARee8AS?=
 =?us-ascii?Q?ZZbRrIfy+gdCGgFP7wWbRKPpdIotXhXZ5C0nk8aWx1HK7xMu8pj3g4GBPs/D?=
 =?us-ascii?Q?92oUg2qTAKfV8zes+KQ1xooMZ3+n1Xi7GvcyDSUq3yt0KzuoSgQLUvOUu5MM?=
 =?us-ascii?Q?OWRSAfqG7eBBf3kLqjNGFm13qYOWQR/Ya/fQa2jA3r0KSPxGr80IiDvMs8s3?=
 =?us-ascii?Q?GAcPc8Pb3Ocrie+JeLu8Qi6tbOfbag4yj5Un/kH/9SfnJeffhEWokAu9zIR6?=
 =?us-ascii?Q?Vee3hcjLGNCRSAcmcjK/6SNJQ7lQhNOzBdA8RY947RQUJIWkbgaxrLcmzWB1?=
 =?us-ascii?Q?cGVoXy0pXKee8N8lvx6xygUBEFaQvejEFpMOqpNtf+ZsRQDQLzaWIxGdFcW7?=
 =?us-ascii?Q?WUCvFS0WsTmxasdS0uJipD88GiEqd0u1YHTKrU78BQtTCUFk9c3oICMfwY6l?=
 =?us-ascii?Q?1TtmDbCQhgFWzwhqXV/xxlyX5RD45p6AqOrtvPn6DoB4fBQBTKkcJbm2ILJ5?=
 =?us-ascii?Q?LdocKLtohG+Xa9hZfrUaC3h7MTdRo000+cPNI9NMsMHK0H2pafMBG4Tkz9OG?=
 =?us-ascii?Q?5nqDh06H4XLpa3mqqS7GxZzKHch7rPemvh3+G+exK1kLZJKeI7fokRSpNkG7?=
 =?us-ascii?Q?jDq+HUra/FLnlXyRbP0JMpTqTizRxk5B4XRoCQlHiPyKXKyoo8vlkMcYTYUa?=
 =?us-ascii?Q?9/KhfWwqlu4Vj2OzcUG1tv443ZtXLUYio224Qc0oCGpRbca73ry9bCpAEkU3?=
 =?us-ascii?Q?Mz+luWWjDOsbrkZ2bsVC1q/8QL53dHf8BwSbkO44D2PMpEm9UsxhdZ08DR4g?=
 =?us-ascii?Q?52B4KbpFNpHMRCX+uW5Veq8a7y2MKPsU45hq5tvZhBzDhqz0+9vsLNCH6+mv?=
 =?us-ascii?Q?Z6d/I70X0rjqoQ21/RCsxOnfUFa8ozjcz81RqJuzM/zjZBxajXyRzLYrMyXh?=
 =?us-ascii?Q?TUWRjqcO/0eSJA9JaZpz7dtjqmwDBSbSl66ykeTInfZKTmj9lykOj62ffoYb?=
 =?us-ascii?Q?oEfgML/TmiJcaS2dPjX4CvhkNM1MC6tt/k36O4nmzDA7+bC5eQxtOTlGCDJQ?=
 =?us-ascii?Q?fFsnYo9ugJ8lX+GuLXZrISJQ73r/Qgg=3D?=
X-Exchange-RoutingPolicyChecked: VtYugGeFFsXy3ygJbM/kpymwi1npbGOdDS84uTCIUYniXJUSiqj+miXS8rbJl5nEWpLQZybjvGq0rRtwscetmyPY8VErHqYYb7yOkiy33J5dou6LFSJE0TB36B9iQqlORD1SjJKZXcZFcMLBs+oY97BtDvi+2L47nLN6sdkxpshRi1y7LYbnYteclL00JUxz1N1x/iZLqcz+YrZIQimV4W/64SK4hsMXe+DH7DeMk7/XagTNbyvQmn1ZBOT5/5xZwhOPkvdoIYmmdKsrDIZrd4/bcGvcWZ5mU1qGNkIo+QcnxdWlElzyPzu9NOYVVqXCmt+n3xEoM9x7MigFaQaJDg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5600b943-dcfa-4019-5698-08def2941258
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 01:51:31.4603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gY2cMf7YX5brCJtvu1cqd4Yqd6zkOwnxmiIcLSTsemyfZJ1YeOgqEWk4KqWk/267H3kx9YtZPsiW9sSjh0UGMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5215
X-OriginatorOrg: intel.com
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Parth,

Sorry for the delay, response inline below:

On Mon, Aug 03, 2026 at 02:16:48AM +0530, Parth Kamani wrote:
>    Hi Rodrigo,                                                                  
>                                                                                 
>    I was looking through drivers/gpu/drm/i915/TODO.txt and noticed that there   
>    are still a number of outstanding items. One that caught my attention was    
>    "for discrete memory manager, merge enough dg1 to be able to refactor it     
>    to ...". I also saw items such as "Come up with a plan what to do with       
>    drm/scheduler and how to get there" and "Roll out dma_fence critical         
>    section annotations", so it looks like there are several areas that still    
>    need work.                                                                   

Oh, I believe this TODO list is so outdated.

I'd say that the core part of i915 is pretty much under maintenance mode.
We are focusing on adding new features on xe driver that supports the new
platforms.

>                                                                                 
>    From the TODO, some of these items appear more involved than others, so      
>    before I dive in I wanted to check with you. Is the discrete memory          
>    manager item still something that would be appropriate to work on, or        
>    would you recommend a different task for someone making a first              
>    contribution to i915?                                                        

Honestly, one of the big reasons that we started the new driver was the
difficulty of this task :)

>                                                                                 
>    My preference is to keep patches small enough to review comfortably, run     
>    checkpatch --strict, test against current mainline, and submit them via      
>    git send-email.                                                              

That is mandatory! :)
Please always do this no matter what patch you are sending.

Perhaps a good and very easy initial patch is to remove this TODO file hehe :)
At least this might trigger a public discussion in our mailing list if we
have anything valid there or if we should kill it entirely.

>                                                                                 
>    I'm currently in my final year of B.Tech in Computer Engineering at K J      
>    Somaiya College of Engineering, Mumbai (graduating mid-2027), and I have a   
>    meaningful amount of time to contribute before graduation. I'd much rather   
>    spend that time contributing to a live upstream codebase than working only   
>    on coursework. If there's a better first task than the TODO item above,      
>    I'd really appreciate your recommendation and would be happy to work on      
>    that instead.                                                                

That is very exciting! I'm so glad to see students volunteering to take the
next steps and contributing to open source drivers. It is so refreshing to see!

Keep up with this great spirit!

What machine do you have? what is your integrated intel gpu? Something local
is always better.

If it is a not very old intel hardware perhaps it already has support
from our new driver and you could see if there's any issue that you could take:

https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/?sort=created_date&state=opened&first_page_size=20

or perhaps even i915 driver:

https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items?sort=created_date&state=opened&first_page_size=20

>                                                                                 
>    Thank you for your time, and I look forward to hearing from you.             

I'm sorry for the delay and welcome to the community!

>                                                                                 
>    Best regards,                                                                
>                                                                                 
>    Parth Kamani                                                                 
>    Final-year B.Tech Computer Engineering                                       
>    K J Somaiya College of Engineering, Mumbai                                   
>    Email: [1]parthvipulkamani@gmail.com                                         
>    Phone: +91 9820081318                                                        
> 
> References
> 
>    Visible links
>    1. mailto:parthvipulkamani@gmail.com
