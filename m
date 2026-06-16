Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF3ACD98CF
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Jun 2026 09:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9894410E95C;
	Tue, 16 Jun 2026 09:14:25 +0000 (UTC)
X-Greylist: delayed 555 seconds by postgrey-1.36 at gabe;
 Tue, 16 Jun 2026 09:14:24 UTC
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34A910E95C
 for <intel-gfx@lists.freedesktop.org>; Tue, 16 Jun 2026 09:14:24 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown
 [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 7D7033F202
 for <intel-gfx@lists.freedesktop.org>; Tue, 16 Jun 2026 11:05:07 +0200 (CEST)
Message-ID: <3a304a3e-42d0-4123-8013-fd1ca2c7f88d@hogyros.de>
Date: Tue, 16 Jun 2026 18:05:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: intel-gfx@lists.freedesktop.org
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
Subject: Three monitors on HD4000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

I just dusted off an old i7-3610QM laptop, which seem to have lost its 
ability to drive two external monitors in addition to the internal 
display at some point in the last years.

Initially, the X server starts fine, and I get a 5740x1080 configuration 
with three outputs, but the last one does not work. Attempting to change 
the order of monitors gives a crtc configuration error.

The hardware has two pixel clock generators and three crtcs, so this 
should be possible as long as both external monitors are using the same 
mode over the same interface, and it used to work in the past.

How would I start debugging this?

    Simon
