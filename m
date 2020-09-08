Return-Path: <SRS0=Nr63=CR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C541EC433E2
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2020 14:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 615B722527
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2020 14:24:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="m0E3zr9A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 615B722527
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931956E848;
	Tue,  8 Sep 2020 14:24:00 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423586E492
 for <intel-gfx@lists.freedesktop.org>; Tue,  8 Sep 2020 06:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sksp/t0ni/xrmSuCxSHeJAbkuuheoDez0O8NIcBsyNY=; b=m0E3zr9AelfXyWNRedxJdmPxni
 /5kOwchSrWI2cUO0Kcaakoe0rgd0DMbjZelgTJTiAXThC5QLC8QCvHTgL6y+HhaqjWuPx5Ywqh8wI
 ClsQw8MY+LH5Bwa2ThIPoe7KR1wxLxnTwgOTS+315FS2eIzyUGq+YZUbfa/dnPAC9XQPMWu+uURuM
 xfoswb7HyU5gjU4Yf6JXFCFBaTq8VqvMe0lozrt4izVdTS7WXAV6d3Ox3GLZh2VnLVN+XuLZUVDGO
 fvlfFMIlwEzcWsF/F3Y8EDDplTYAfXs718yKVGEMySswnjnCgp6u3Y3Ms8p58Xc92B/UVOOQMx9vM
 uUAupsNA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kFX2M-0006nR-W4; Tue, 08 Sep 2020 06:23:27 +0000
Date: Tue, 8 Sep 2020 07:23:26 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <20200908062326.GB20774@infradead.org>
References: <20200903201839.7327-1-murphyt7@tcd.ie>
 <20200903201839.7327-6-murphyt7@tcd.ie>
 <20200907070035.GA25114@infradead.org>
 <CALQxJute8_y=JsW4UV1awSccOjxT_1OyPdymq=R_PurVQzENeQ@mail.gmail.com>
 <20200908053619.GA15418@infradead.org>
 <20200908055510.GA19078@infradead.org>
 <9655fdc9-6ea0-e4c1-e104-a9a8981ecb1e@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9655fdc9-6ea0-e4c1-e104-a9a8981ecb1e@linux.intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Tue, 08 Sep 2020 14:23:54 +0000
Subject: Re: [Intel-gfx] [PATCH V2 5/5] DO NOT MERGE: iommu: disable list
 appending in dma-iommu
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
Cc: intel-gfx@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 Tom Murphy <murphyt7@tcd.ie>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Sep 08, 2020 at 02:04:53PM +0800, Lu Baolu wrote:
> Do you mind telling where can I find Marek's series?

[PATCH v10 00/30] DRM: fix struct sg_table nents vs. orig_nents misuse

on various lists including the iommu one.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
