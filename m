Return-Path: <SRS0=5YwX=DJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F731C4363D
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Oct 2020 11:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDAF3206C9
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Oct 2020 11:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDAF3206C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B41B6E059;
	Fri,  2 Oct 2020 11:59:21 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825E96E059
 for <Intel-gfx@lists.freedesktop.org>; Fri,  2 Oct 2020 11:59:20 +0000 (UTC)
IronPort-SDR: KsqIOq3aNbhyW6ZjNj6JuF36nc0R+myvLPTJdToqCMaGk5PTDoMkAVCIzxxee5G1+I2/XQJvzy
 cAlqW/eTL8ng==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="163059643"
X-IronPort-AV: E=Sophos;i="5.77,327,1596524400"; d="scan'208";a="163059643"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2020 04:59:17 -0700
IronPort-SDR: OtNiM2HO2Z1S5KtTbtVc5cavGbgWoRWySKGU2DCpD77OVe0Lf/vd46XtwcUK/2V8m0hld57YT/
 RCyoSYnCtHXQ==
X-IronPort-AV: E=Sophos;i="5.77,327,1596524400"; d="scan'208";a="508270379"
Received: from yili1-mobl.ccr.corp.intel.com (HELO [10.254.208.108])
 ([10.254.208.108])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2020 04:59:15 -0700
To: Joerg Roedel <joro@8bytes.org>
References: <20200927063437.13988-1-baolu.lu@linux.intel.com>
 <e999e371-6d36-ffea-542f-a5f4b230b0ed@linux.intel.com>
 <c2af9a9d-1cae-b8f7-a0b3-880574060a23@linux.intel.com>
 <20201001121701.GB30426@8bytes.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <5a9d7412-3d7a-f4f7-e3b9-c295718448aa@linux.intel.com>
Date: Fri, 2 Oct 2020 19:59:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201001121701.GB30426@8bytes.org>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v4 0/7] Convert the intel iommu driver to
 the dma-iommu api
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
Cc: Ashok Raj <ashok.raj@intel.com>, Intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>, baolu.lu@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Joerg,

On 2020/10/1 20:17, Joerg Roedel wrote:
> Hi Baolu,
> 
> On Tue, Sep 29, 2020 at 08:11:35AM +0800, Lu Baolu wrote:
>> I have no preference. It depends on which patch goes first. Let the
>> maintainers help here.
> 
> No preference on my side, except that it is too late for this now to
> make it into v5.10. Besides that I let the decission up to you when this
> is ready. Just send me a pull-request when it should get into the
> iommu-tree.

Sure.

Best regards,
baolu

> 
> Regards,
> 
> 	Joerg
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
