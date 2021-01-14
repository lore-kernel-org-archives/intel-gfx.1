Return-Path: <SRS0=EqF4=GR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAABC433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Jan 2021 11:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96208238EC
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Jan 2021 11:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96208238EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=etezian.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CA66E1F2;
	Thu, 14 Jan 2021 11:22:32 +0000 (UTC)
X-Greylist: delayed 8402 seconds by postgrey-1.36 at gabe;
 Thu, 14 Jan 2021 11:22:31 UTC
Received: from 4.mo5.mail-out.ovh.net (4.mo5.mail-out.ovh.net [178.33.111.247])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4319B6E1F2
 for <intel-gfx@lists.freedesktop.org>; Thu, 14 Jan 2021 11:22:31 +0000 (UTC)
Received: from player738.ha.ovh.net (unknown [10.108.57.188])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id C13A72A2E57
 for <intel-gfx@lists.freedesktop.org>; Thu, 14 Jan 2021 04:02:40 +0100 (CET)
Received: from etezian.org (213-243-141-64.bb.dnainternet.fi [213.243.141.64])
 (Authenticated sender: andi@etezian.org)
 by player738.ha.ovh.net (Postfix) with ESMTPSA id 0149C1A1E00CE;
 Thu, 14 Jan 2021 03:02:36 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006a052cde2-7da0-43d9-b05e-4a97338ea743,
 72D3C5DAFF26A6515C48D523C3EFD44FB281F22F) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 213.243.141.64
Date: Thu, 14 Jan 2021 05:02:35 +0200
From: Andi Shyti <andi@etezian.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <X/+0SwPEymNDCRZ0@jack.zhora.eu>
References: <20210113124600.656-1-chris@chris-wilson.co.uk>
 <20210113124600.656-8-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210113124600.656-8-chris@chris-wilson.co.uk>
X-Ovh-Tracer-Id: 12992884925960798729
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedukedrtdeggdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughisegvthgviihirghnrdhorhhgqeenucggtffrrghtthgvrhhnpedtgfduudfhfeeuueejfeeihedtfeetgfegveehgfeuleelhfduteegieekudeifeenucfkpheptddrtddrtddrtddpvddufedrvdegfedrudeguddrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdprhgtphhtthhopehinhhtvghlqdhgfhigsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
Subject: Re: [Intel-gfx] [PATCH 08/10] drm/i915/gt: Convert stats.active to
 plain unsigned int
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Chris,

On Wed, Jan 13, 2021 at 12:45:58PM +0000, Chris Wilson wrote:
> As context-in/out is now always serialised, we do not have to worry
> about concurrent enabling/disable of the busy-stats and can reduce the
> atomic_t active to a plain unsigned int, and the seqlock to a seqcount.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

looks correct...

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Thanks,
Andi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
