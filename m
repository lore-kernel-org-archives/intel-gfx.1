Return-Path: <SRS0=QVu9=CU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E88C43461
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Sep 2020 14:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4326B222C2
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Sep 2020 14:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4326B222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=etezian.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A920A6E05D;
	Fri, 11 Sep 2020 14:36:53 +0000 (UTC)
X-Greylist: delayed 8732 seconds by postgrey-1.36 at gabe;
 Fri, 11 Sep 2020 14:36:52 UTC
Received: from 2.mo2.mail-out.ovh.net (2.mo2.mail-out.ovh.net [188.165.53.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476716E05D
 for <intel-gfx@lists.freedesktop.org>; Fri, 11 Sep 2020 14:36:52 +0000 (UTC)
Received: from player687.ha.ovh.net (unknown [10.110.208.44])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 2B1F01E7BE7
 for <intel-gfx@lists.freedesktop.org>; Fri, 11 Sep 2020 14:11:17 +0200 (CEST)
Received: from etezian.org (213-243-141-64.bb.dnainternet.fi [213.243.141.64])
 (Authenticated sender: andi@etezian.org)
 by player687.ha.ovh.net (Postfix) with ESMTPSA id 75C9B16043999;
 Fri, 11 Sep 2020 12:11:08 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00271dcdf64-20b9-4627-bc39-206d89f9c972,
 3D0851B72870E27FC52B1A01C0C35111A9395DFF) smtp.auth=andi@etezian.org
Date: Fri, 11 Sep 2020 15:11:07 +0300
From: Andi Shyti <andi@etezian.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200911121107.GA2330@jack.zhora.eu>
References: <20200911113414.GC367487@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911113414.GC367487@mwanda>
X-Ovh-Tracer-Id: 7594476348348744296
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudehledghedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihesvghtvgiiihgrnhdrohhrgheqnecuggftrfgrthhtvghrnheptdfgudduhfefueeujeefieehtdeftefggeevhefgueellefhudetgeeikeduieefnecukfhppedtrddtrddtrddtpddvudefrddvgeefrddugedurdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheikeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhrtghpthhtohepihhnthgvlhdqghhfgieslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: test the correct
 variable in igt_gem_ww_ctx()
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Dan,

> There is a copy and paste error here.  The "obj" should be "obj2".  The
> current code could result in an Oops.
> 
> Fixes: 80f0b679d6f0 ("drm/i915: Add an implementation for i915_gem_ww_ctx locking, v2.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/i915/selftests/i915_gem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
> index 23a6132c5f4e..412e21604a05 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
> @@ -211,8 +211,8 @@ static int igt_gem_ww_ctx(void *arg)
>  		return PTR_ERR(obj);
>  
>  	obj2 = i915_gem_object_create_internal(i915, PAGE_SIZE);
> -	if (IS_ERR(obj)) {
> -		err = PTR_ERR(obj);
> +	if (IS_ERR(obj2)) {
> +		err = PTR_ERR(obj2);
>  		goto put1;
>  	}

ops...

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Thanks,
Andi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
