Return-Path: <SRS0=EqF4=GR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8846C433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Jan 2021 03:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D6E32368A
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Jan 2021 03:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D6E32368A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=etezian.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C014D89CA1;
	Thu, 14 Jan 2021 03:11:04 +0000 (UTC)
X-Greylist: delayed 473 seconds by postgrey-1.36 at gabe;
 Thu, 14 Jan 2021 03:11:03 UTC
Received: from 4.mo178.mail-out.ovh.net (4.mo178.mail-out.ovh.net
 [46.105.49.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDC489CA1
 for <intel-gfx@lists.freedesktop.org>; Thu, 14 Jan 2021 03:11:03 +0000 (UTC)
Received: from player726.ha.ovh.net (unknown [10.108.4.253])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id D8E9DBC90E
 for <intel-gfx@lists.freedesktop.org>; Thu, 14 Jan 2021 04:03:07 +0100 (CET)
Received: from etezian.org (213-243-141-64.bb.dnainternet.fi [213.243.141.64])
 (Authenticated sender: andi@etezian.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 4489719EF243D;
 Thu, 14 Jan 2021 03:03:04 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003a5bfec65-3067-45a2-88f6-98f7c6736fac,
 72D3C5DAFF26A6515C48D523C3EFD44FB281F22F) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 213.243.141.64
Date: Thu, 14 Jan 2021 05:03:03 +0200
From: Andi Shyti <andi@etezian.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <X/+0Z1bDmk1uW0KV@jack.zhora.eu>
References: <20210113124600.656-1-chris@chris-wilson.co.uk>
 <20210113124600.656-10-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210113124600.656-10-chris@chris-wilson.co.uk>
X-Ovh-Tracer-Id: 13000484751414575625
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedukedrtdeggdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughisegvthgviihirghnrdhorhhgqeenucggtffrrghtthgvrhhnpedtgfduudfhfeeuueejfeeihedtfeetgfegveehgfeuleelhfduteegieekudeifeenucfkpheptddrtddrtddrtddpvddufedrvdegfedrudeguddrieegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjedviedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdprhgtphhtthhopehinhhtvghlqdhgfhigsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
Subject: Re: [Intel-gfx] [PATCH 10/10] drm/i915/gt: Reduce GT runtime stats
 from seqlock to a latch
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

On Wed, Jan 13, 2021 at 12:46:00PM +0000, Chris Wilson wrote:
> Since we can compute the elapsed time to add to the total, during the
> PMU sample we only need to have a consistent view of the (start, total,
> active) tuple to be able to locally determine the runtime. That can be
> arrange by a pair of memory bariiers and carefully sequencing of the
> writes and reads.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Thanks,
Andi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
