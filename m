Return-Path: <SRS0=Opgb=NH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6592C4338F
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Aug 2021 09:58:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87AB261B72
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Aug 2021 09:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87AB261B72
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=simenc.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F395D89D99;
	Mon, 16 Aug 2021 09:58:12 +0000 (UTC)
X-Greylist: delayed 20196 seconds by postgrey-1.36 at gabe;
 Sun, 15 Aug 2021 00:23:16 UTC
Received: from smtprelay01.ispgateway.de (smtprelay01.ispgateway.de
 [80.67.18.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B49189DD8
 for <intel-gfx@lists.freedesktop.org>; Sun, 15 Aug 2021 00:23:15 +0000 (UTC)
Received: from [93.224.175.56] (helo=[10.0.0.30])
 by smtprelay01.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <gregor@simenc.de>) id 1mEygH-00081h-KW
 for intel-gfx@lists.freedesktop.org; Sat, 14 Aug 2021 20:46:53 +0200
To: intel-gfx@lists.freedesktop.org
From: "Dr. Gregor Simenc" <gregor@simenc.de>
Message-ID: <4bee2867-e0fa-67c1-eea0-ef8bdd3a5879@simenc.de>
Date: Sat, 14 Aug 2021 20:46:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
X-Df-Sender: Z3JlZ29yQHNpbWVuYy5kZQ==
X-Mailman-Approved-At: Mon, 16 Aug 2021 09:58:05 +0000
Subject: [Intel-gfx] SR-IOV development status
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

Hi there

is there any progress in development a SR-IOV driver for Xe graphics in 
tigerlake architecture für linux ?

Any comments are welcome.

I appreciate a driver to share my iGPU in KVM for other VMs like Windows.


Best wishes

Gregor

