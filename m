Return-Path: <SRS0=5qC0=PQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F288C433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 28 Oct 2021 17:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FB9560C4B
	for <intel-gfx@archiver.kernel.org>; Thu, 28 Oct 2021 17:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FB9560C4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=etezian.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7778E6E99E;
	Thu, 28 Oct 2021 17:51:12 +0000 (UTC)
X-Greylist: delayed 4512 seconds by postgrey-1.36 at gabe;
 Thu, 28 Oct 2021 17:51:10 UTC
Received: from 4.mo584.mail-out.ovh.net (4.mo584.mail-out.ovh.net
 [178.32.98.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8C66E99E
 for <intel-gfx@lists.freedesktop.org>; Thu, 28 Oct 2021 17:51:10 +0000 (UTC)
Received: from player787.ha.ovh.net (unknown [10.108.1.93])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 77E8422050
 for <intel-gfx@lists.freedesktop.org>; Thu, 28 Oct 2021 16:33:22 +0000 (UTC)
Received: from etezian.org (unknown [31.22.57.166])
 (Authenticated sender: andi@etezian.org)
 by player787.ha.ovh.net (Postfix) with ESMTPSA id 34FBB23ED280B;
 Thu, 28 Oct 2021 16:33:14 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005a037f3d6-d91c-491d-be00-dfefa369bff3,
 19738AB094897BD963DB89D239EF437C7015E8F6) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 31.22.57.166
Date: Thu, 28 Oct 2021 18:33:13 +0200
From: Andi Shyti <andi@etezian.org>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi@etezian.org>
Message-ID: <YXrQyaDnNEtOqJ2K@jack.zhora.eu>
References: <20211008215635.2026385-1-matthew.d.roper@intel.com>
 <20211008215635.2026385-11-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008215635.2026385-11-matthew.d.roper@intel.com>
X-Ovh-Tracer-Id: 15047089305654004234
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegfedgudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihesvghtvgiiihgrnhdrohhrgheqnecuggftrfgrthhtvghrnheptdfgudduhfefueeujeefieehtdeftefggeevhefgueellefhudetgeeikeduieefnecukfhppedtrddtrddtrddtpdefuddrvddvrdehjedrudeiieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjeekjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdprhgtphhtthhopehinhhtvghlqdhgfhigsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
Subject: Re: [Intel-gfx] [PATCH 10/11] drm/i915: Release per-gt resources
 allocated
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

Hi Matt and Venkata,

On Fri, Oct 08, 2021 at 02:56:34PM -0700, Matt Roper wrote:
> From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
> 
> Iterate for_each_gt during release to support multi-tile
> devices.
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

This patches are quite similar, we could even think of squashing
them.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
