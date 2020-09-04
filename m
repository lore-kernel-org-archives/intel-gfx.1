Return-Path: <SRS0=Y2nD=CN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60789C43461
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Sep 2020 10:14:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36190206D4
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Sep 2020 10:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36190206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDA46E21B;
	Fri,  4 Sep 2020 10:14:56 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5E86E21B
 for <intel-gfx@lists.freedesktop.org>; Fri,  4 Sep 2020 10:14:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 488FFAF50;
 Fri,  4 Sep 2020 10:14:55 +0000 (UTC)
Date: Fri, 4 Sep 2020 12:14:52 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <20200904101452.GD28643@suse.de>
References: <20200822160209.28512-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200822160209.28512-1-chris@chris-wilson.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Intel-gfx] [PATCH] iommu/intel: Handle 36b addressing for
 x86-32
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
Cc: James Sewart <jamessewart@arista.com>, iommu@lists.linux-foundation.org,
 intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Sat, Aug 22, 2020 at 05:02:09PM +0100, Chris Wilson wrote:
> Beware that the address size for x86-32 may exceed unsigned long.
> 
> [    0.368971] UBSAN: shift-out-of-bounds in drivers/iommu/intel/iommu.c:128:14
> [    0.369055] shift exponent 36 is too large for 32-bit type 'long unsigned int'
> 
> If we don't handle the wide addresses, the pages are mismapped and the
> device read/writes go astray, detected as DMAR faults and leading to
> device failure. The behaviour changed (from working to broken) in commit
> fa954e683178 ("iommu/vt-d: Delegate the dma domain to upper layer"), but
> the error looks older.
> 
> Fixes: fa954e683178 ("iommu/vt-d: Delegate the dma domain to upper layer")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: James Sewart <jamessewart@arista.com>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: Joerg Roedel <jroedel@suse.de>
> Cc: <stable@vger.kernel.org> # v5.3+
> ---
>  drivers/iommu/intel/iommu.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Applied for v5.9, thanks.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
